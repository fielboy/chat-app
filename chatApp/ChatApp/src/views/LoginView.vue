<template>
  <div class=" bg-secondary" style="height: 100vh;">
    <form  name="login" @submit.prevent="handleSubmit" style="padding-top: 10%; margin-left: 25%;">
    <div class="card" style="width: 50vw;">
      <div class="card-body">
        <h5 class="card-title text-center h2">Log in to Chat app</h5>
        <input
            v-model="email"
            type="text"
            name="username"
            placeholder="Email"
            required
            class="form-control"
          /><br />
          <input v-model="password" type="password" class="form-control" name="password" placeholder="Password" required autocomplete="on" />
          <button class="btn btn-primary w-100 mt-4" type="submit">Login</button>
        <p>Not registered yet? <router-link :to="{name:'register'}">Register Here</router-link></p>
        </div>
    </div>
  </form>
  </div>
</template>

<script  setup>
import { useAuthStore } from '../stores/auth';
import { ref } from 'vue'
import { useRouter } from "vue-router";



const router = useRouter()
const store = useAuthStore()

const email = ref('') 
const password = ref('') 

const handleSubmit = async()=>{
  if(validateInputs()){
    alert('Please input the username and password')
    return;
  }
  const credentials = {
    email: email.value,
    password: password.value
  }

  await store.loginAccoount(credentials)
  if(store.isSuccess){
    alert("Successfully Logged in")
    router.push({name:'home'})
  }else{
    alert("Something went wrong")
  }
}

const validateInputs = ()=>{
  let isError = false

  if(email.value == ''){
    isError = true
  }
  if(password.value == ''){
    isError = true
  }


  return isError
}

</script>


