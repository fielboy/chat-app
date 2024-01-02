<template>
  <div class="form container-fluid bg-secondary" style="height: 100vh;">
    <form name="registration" style="padding-top: 10%; margin-left: 23%;">
      <div class="card" style="width: 700px;">
        <div class="card-title text-center h2 my-2">Register to Chat app</div>
        <div class="card-body">
          <div class="row">
        <div class="col-6">
          <input v-model="fullname" type="text" name="Fullname" class="form-control" placeholder="Fullname"  autocomplete="on"/>

        </div>
        <div class="col-6 mb-2">
      <input v-model="username" type="text" name="username" class="form-control" placeholder="username"  autocomplete="on"/>
          
        </div>
        <div class="col-6">
      <input v-model="email" type="Email" name="Email" class="form-control" placeholder="Email"  autocomplete="on"/>
          
        </div>
        <div class="col-6">
      <input v-model="password" type="password" name="password" class="form-control" placeholder="Password"  autocomplete="on"/>
          
        </div>
      </div>

      <div class="birthday-input">
        <label  for="birthday">Birthday:</label>
        <input v-model="birthday" class="form-control" type="date" name="birthday" id="birthday"  />
      </div>
      <br />
      <div class="genderlabel">
        <span for="gender-male">Gender:</span>
        <input v-model="gender" type="radio" name="gender" value="male" id="male"  />
        <label for="male">Male</label>
        <input  v-model="gender" type="radio" name="gender" value="female" id="gender-female"  />
        <label for="gender-female">Female</label>
      </div>
  <button class="btn btn-primary ms-2 w-100 mt-2" @click="handleSubmit">Register</button>
  <router-link to="/login" class="mr-2">
    <p class=" text-center">Login</p>
  </router-link>

        </div>
        
      </div>
      <br>
      
    </form>
    
  </div>
</template>

<script setup>
import {ref} from 'vue'
import { useAuthStore } from '../stores/auth';
import { useRouter } from "vue-router";

const router = useRouter()
const store = useAuthStore()

// register

const fullname = ref('')
const username = ref('')
const email = ref('')
const password = ref('')
const birthday = ref('')
const gender = ref('')



const handleSubmit = async()=>{

  if(valudateInputs()){

    alert('Please provide credentials')
    return;
  }

  const credentials = {
    user_name:username.value,
    fullname:fullname.value,
    email:email.value,
    password:password.value,
    birthday:birthday.value,
    gender:gender.value
  }

  await store.registerAccount(credentials)
  if(store.isSuccess){
    alert('Successfully Registered!')
    router.push({name:'login'})
  }else{
    alert('Something went wrong')
  }
}

const valudateInputs = ()=>{
  let isError = false

  if(fullname.value == ''){
    isError = true
  }
  if(username.value == ''){
    isError = true
  }
  if(email.value == ''){
    isError = true
  }
  if(password.value == ''){
    isError = true
  }
  if(birthday.value == ''){
    isError = true
  }
  if(gender.value == ''){
    isError = true
  }



  return isError
}

</script>


