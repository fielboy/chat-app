
const express = require('express');
const http = require('http');
const socketIo = require("socket.io");
const app = express();
const jwt = require("jsonwebtoken")
const server = http.createServer(app);
const io = socketIo(server,{
    cors: {
        origin: "*",
        methods: ["GET", "POST"]
      }
});
const mysql = require("mysql2");
const con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "chat_db"
});
const isAuthenticated = (socket, next) => {
    const query = socket.handshake.query;

    if (query && query.token){
        jwt.verify(query.token, "d2c7eae4b025a186db0f1c8490c946a9f50e5a4a3c08e769a93d22f3785bbf3d", (err, decoded) => {
        if (err) return next(new Error('Authentication error'));
            socket.decoded = decoded;
            next();
        });
    }
    else {
        next(new Error('Authentication error'));
    }    
};
io.use(isAuthenticated);
io.on("connection", (socket) => {
    socket.on('send-message', (message,user_name,user_id) =>{

        const sql = "INSERT INTO messages(user_id, message_text) VALUES(?, ?)";
        con.query(sql, [user_id, message], (err, result)=>{
            
            if(!err){
                io.emit("chat", message,user_name);
            }
            else{
                io.emit("chat", {user_id: 0, message_text: "Server Error"});
            }
            
        });

        io.emit('receive-message', message,user_name);
    });



    socket.on('get-all-messages', ()=>{
        
        const sql = "SELECT * FROM  messages";
        con.query(sql,(err, result)=>{
            console.log(result)
            if(!err){
                io.emit("all-messages", {data:result});
            }
            else{
                io.emit("all-messages", {user_id: 0, message_text: "Server Error"});
            }
            
        });
    })
});

server.listen(5002,()=>{
    console.log('server is up and running on port 5002');
})