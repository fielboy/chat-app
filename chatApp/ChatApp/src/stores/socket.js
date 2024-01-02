import { defineStore } from "pinia";
import { ref } from "vue";
import { io } from 'socket.io-client';


export const useSocketStore = defineStore('socketStore',() => {
    const token = JSON.parse(localStorage.getItem("token"));
    const socket =  io('http://localhost:5002/', {
        query: {token}
    });
    const connected = ref(false)
    const messages = ref([])

    const connect = () => {
        socket.on('connection',()=>{
            connected.value = true;
        });
        socket.on('disconnect',()=>{
            connected.value = false;
        });
        socket.on('send-message',(message)=>{
            message.value = message;
            console.log(message)
        });
     
        socket.on('get-all-messages',()=>{
            socket.emit('get-all-messages',(data)=>{
                console.log(data)
            })
        })
    }
    
    const receiveMessage = ()=>{
        socket.on('receive-message',(message,user_name)=>{
            messages.value.push({username:user_name, message:message})
        });
    }

    const sendMessage = (message,user_name,user_id) => {
        socket.emit('send-message', message,user_name,user_id);
    }


    return {
        connected,messages, connect, sendMessage, receiveMessage
    }
})