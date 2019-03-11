<template>
    <div class="app-register">
        <div style="margin:20px 10px;border:1px solid #1de8b3;border-radius:15px;">
            <div class="form">
            <h3 style="text-align:center;color:#1de8b3;margin:20px 0;">——— 欢迎注册 ———</h3>
            <div><span>用&nbsp;户&nbsp;名</span><input type="text" name="uanem" placeholder="请输入用户名" autofocus required v-model="uname"></div>
            <div><span>密 &nbsp;&nbsp;&nbsp;码</span><input type="password" name="upwd" placeholder="请输入密码" required v-model="pwd"></div>
            <div><span>密&nbsp;&nbsp;&nbsp;码</span><input type="password" name="upwd" placeholder="请再次输入密码" required v-model="pwd1"></div>
            <div><span>手 &nbsp;&nbsp;&nbsp;机</span><input type="tel" name="number" placeholder="请输入手机号" required v-model="phone"></div>
            <div><span>邮 &nbsp;&nbsp;&nbsp;箱</span><input type="email" name="email" placeholder="请输入邮箱" required v-model="email"></div>
            <div><button @click="btn">注册</button><button @click="reset">重置</button></div>
            </div>
        </div>
    </div>
</template>
<script>
import {Toast} from "mint-ui";
    export default{
        data(){
            return {
                uname:"",
                pwd:"",
                pwd1:"",
                phone:"",
                email:""
            }
        },
        methods:{
            btn(){
                var reg=/^1[3-8][0-9]{9}$/;
                var reg1=/^\w+@\w+(\.[a-zA-Z]{2,3}){1,2}$/; 
                if(this.pwd==this.pwd1&&reg.test(this.phone)&&reg1.test(this.email)){
                var postData = this.qs.stringify({
                    uname:this.uname,
                    pwd:this.pwd,
                    phone:this.phone,
                    email:this.email
                });
                var url="http://127.0.0.1:3000/register";
                this.axios.post(url,postData).then(result=>{
                    if(result.data.code==1){
                        this.$router.push("login");
                    }else{Toast("该用户名已占用")}

                })
                }else{
                    if(this.pwd!=this.pwd1){
                    Toast("密码不一致")}
                    if(reg.test(this.phone)==0){Toast("手机号码不合法")}
                    if(reg1.test(this.email)==0){Toast("邮箱格式不正确")}
                    }
            },
            reset(){
               this.uname="";
               this.pwd="";
               this.pwd1="";
               this.tel=""; 
               this.email=""
            }
        },
        created(){

        }
    }
</script>
<style>
    .app-register .form input{width:220px;margin-left:10px;height:32px;border-radius:10px;font-size:14px;}
     .app-register .form div{text-align:center;}
     .app-register .form div button{margin:0 20px 20px 20px;background:#1de8b3;border-radius:5px;width:80px;color:#fff;}
      
     
</style>