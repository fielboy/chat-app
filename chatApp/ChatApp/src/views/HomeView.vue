<template>
  <div class="container-fluid bg-primary">
    <div class="header">
      <div class="logo1">
        <h1 style="color: white">Chat app</h1>
      </div>
      <div class="header-profile">
        <span>Welcome {{ userInfo.gender == 'male' ? 'Mr.' : 'Ms.' }} {{ userInfo.fullname }} </span>
        <img src="../assets/profile.png" alt="" />
      </div>
    </div>
    <div class="content-wrapper">
      <div class="message-box">
        <div class="chat-container">
          <div class="chats">
            <div >
              <h1>People</h1>
              <div class="recent-chat">
                <div class="profile-1"  v-for="n in 5" :key="n">
                  <img src="../assets/profile.png" alt="" />
                  <span style="color: black"> John Doe </span>
                </div>
              </div>
            </div>
          </div>
          <div class="chat-box">
            <div class="box-wrapper">
              <div class="chat-profile">
                <img src="../assets/profile.png" alt="" srcset="" />
                <span>John Doe</span>
              </div>
            </div>
            <div class="message-wrapper">
              <div class="message-content">
                <div v-for="message in socketStore.messages" :key="message.id" style="margin-top: 20px;">
                  <span style="color: rgb(65, 61, 61); margin-left: 60px;  position: absolute;">{{ message.username }}</span>
                    <div class="chat-profile" style="background-color: skyblue; margin-top: 10px; border-radius: 20px;">
                      <img src="../assets/profile.png" alt="" srcset="" />
                      <span style="color: black; margin-top: 20px; position: absolute;" class="ms-2">{{ message.message }}</span>
                    </div>
                </div>
              </div>
              <div style="display: flex; align-items: center;">
                  <input placeholder="Send a message..." class="form-control" style="margin-right: 5px;" v-model="messageInput" id="message-input" type="text" />
                  <img
                      class="send"
                      id="send-icon"
                      src="https://cdn-icons-png.flaticon.com/512/6532/6532019.png"
                      alt="send button"
                      @click="sendMessage"
                      v-if="messageInput"
                  />
              </div>
              </div>
          </div>
        </div>
      </div>
      <div class="profile-overview">
        <div class="user-profile">
          <img src="../assets/profile.png" alt="" />
          <span>{{ userInfo.fullname }}</span>
        </div>
        <div class="personalities">
          <div>
            <ul>
              <li>Username: {{ userInfo.user_name }}</li>
              <li>Fullname: {{ userInfo.fullname }}</li>
              <li>Email: {{ userInfo.email }}</li>
              <li>Gender: {{ userInfo.gender }}</li>
              <li v-if="userInfo">Birthday: {{ userInfo.birthday }}</li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import {format} from 'date-fns'
import { io } from "socket.io-client";
import { ref, onMounted } from "vue";
import { useSocketStore } from "../stores/socket";

const socketStore = useSocketStore();

const userInfo = ref([]);
const token = ref("");
const messageInput = ref("");

const messages = ref([]);

const sendMessage = () => {

  socketStore.sendMessage(messageInput.value,userInfo.value.user_name,userInfo.value.id);
  messageInput.value = "";

};

onMounted(() => {
  if (localStorage.getItem("user")) {
    userInfo.value = JSON.parse(localStorage.getItem("user"));
  }
  if (localStorage.getItem("token")) {
    token.value = JSON.parse(localStorage.getItem("token"));
  }
  socketStore.connect();
  socketStore.receiveMessage();
});
</script>

<style scoped>
.container {
  padding: 20px;
  border-radius: 20px;
  font-family: cursive;
}
h1 {
  color: black;
}

.header {
  display: flex;
  justify-content: space-between;
}
.logo1 img {
  width: 130px;
}
.header-profile {
  display: flex;
  align-items: center;
}
.header-profile span {
  color: white;
  font-size: larger;
}
.header-profile img {
  width: 50px;
}
.content-wrapper {
  width: 99%;
  border-radius: 20px;
  display: flex;
  background: white;
}
.message-box {
  width: 70%;
  border-radius: 20px;
}
.profile-overview {
  width: 29%;
  border-radius: 20px;
  display: grid;
  grid-template-rows: 1fr 1fr 1fr 0.3fr;
  height: 615px;
  padding: 2px;
}
h2 {
  color: black;
}
.chat-container {
  display: flex;
  margin: 10px;
}
.chats {
  width: 30%;
  border: 2px solid white;
  margin-right: 20px;
  background: white;
  border-radius: 15px;
}
.chat-box {
  width: 70%;
  border: 2px solid white;
  display: grid;
  grid-template-rows: 0.1fr 1fr;
  background: grey;
  border-radius: 20px;
}
.chat-wrapper {
  width: auto;
  display: flex;
  flex-direction: column;
  background: grey;
  border-radius: 20px;
}
.chat-wrapper input {
  width: 100%;
}
#search {
  width: auto;
  margin: 10px;
}
.recent-chat {
  justify-content: center;
}
.recent-chat,
.friend-suggestion {
  display: grid;
  grid-template-columns: auto;
  overflow-y: auto;
}
.friend-suggestion {
  grid-template-columns: auto auto;
}
.profile-1 {
  display: flex;
  justify-content: center;
  margin-bottom: 12px;
  color: black;
}
.profile-1 img,
.profile-2 img,
.chat-profile img {
  width: 50px;
  height: 50px;
}
.profile-2 {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  margin-bottom: 12px;
  color: black;
}
.box-wrapper {
  margin: 10px;
  display: flex;
  justify-content: space-between;
  padding: 5px;
  border-radius: 7px;
}
.chat-profile {
  color: black;
}
.option {
  display: flex;
  align-items: center;
}
/* .option{

} */
.message-wrapper {
  margin: 10px;
  border: 2px solid white;
  display: grid;
  grid-template-rows: 1fr 0.2fr;
  background: white;
  border-radius: 20px;
}
.message-content,
.send-message {
  margin: 5px;
  border: 2px solid white;
}
.message-content {
  height: 100%;
  overflow-y: auto;
}
.user1,
.user2 {
  display: flex;
  align-self: flex-end;
}
.send-message-wrapper {
  display: flex;
  justify-content: center;
  margin: 0 10px;
  background: white;
  border-radius: 10px;
}
#message-input {
  width: 520px;
  height: 30px;
  border-radius: 30px;
  background: white;
}
#send-icon {
  width: 50px;
  height: 50px;
}
.user-profile,
.personalities,
.bio,
.buttons {
  display: flex;
  justify-content: center;
  border-radius: 20px;
}
.user-profile {
  flex-direction: column;
  align-items: center;
  border-radius: 20px;
}
.user-profile img {
  width: 150px;
  height: 150px;
}

.personalities-container {
  width: 100%;
  display: flex;
  flex-wrap: wrap;
  border: 2px solid white;
  margin: 10px;
  overflow: auto;
}
.personalities span {
  margin-left: 10px;
}
.add {
  background-color: #0000ff99;
  border-radius: 5px;
  height: 30px;
  padding: 5px;

  margin-right: 5px;
}
.add:hover {
  background-color: violet;
  color: blue;
}
.block {
  background-color: #7c0505;
  border-radius: 5px;
  height: 30px;
  padding: 5px;
  margin-right: 6px;
}
.block:hover {
  background-color: violet;
  color: #7c0505;
}
</style>
