<template>
    <div class="app-login">
        <div class="mui-card">
			<div class="mui-card-header mui-card-media" style="height:59vw;">
            <mt-swipe :show-indicators="false">
            <mt-swipe-item><img src="../../img/1.jpg" alt=""></mt-swipe-item>
            <mt-swipe-item><img src="../../img/2.jpg" alt=""></mt-swipe-item>
            <mt-swipe-item><img src="../../img/3.jpg" alt=""></mt-swipe-item>
             <mt-swipe-item><img src="../../img/4.jpg" alt=""></mt-swipe-item>
            </mt-swipe>
            </div>
            <div class="mui-card-content">
                <div class="mui-card-content-inner">
                    <form>
                        <h3 style="text-align:center;margin-bottom:22px;"><img width="150px" height="30px" src="../../img/welcome.png" alt=""></h3>
                        <div><input type="text" name="uname" required placeholder="请输入用户名" autofocus style="border-radius:5px;" v-model="uname"></div>
                        <div><input type="password" name="upwd" required placeholder="请输入密码" style="border-radius:5px;" v-model="pwd"></div>
                        <div><input type="submit" value="登录" @click="login" style="width:100%;background:#1de8b3;border:1px solid #1de8b3;"></div>
                    </form>
                </div>
		    </div>
            <div class="mui-card-footer" style="display:block" >
                <h5 style="text-align:center;">————第三方登录————</h5><br>
                <div style="text-align:center;" class="login"><img src="../../img/QQ.png" alt=""><img src="../../img/wechat.png" alt="">
                <img src="../../img/weibo.png" alt=""><img src="../../img/pay.png" alt=""></div>
            </div>
            </div>
		</div>
    </div>
</template>
<script>
import {Toast} from "mint-ui"
    export default{
        data(){
            return {
                uname:"",
                pwd:""
            }
        },
    methods:{
        login(){
            var postData = this.qs.stringify({
                    uname:this.uname,
                    pwd:this.pwd});
            var url="http://127.0.0.1:3000/login";
            this.axios.post(url,postData).then(result=>{
                if(result.data.code==1){
                    Toast("登录成功")
                    this.$router.push("user")
                }else{Toast("用户名或密码错误")}
            })
        }
    },
    created(){

    }
 }
</script>
<style>
    .app-login .mint-swipe{height:202px;}
.app-login .mint-swipe img{width:100%;height:200px;}
.app-login .mui-card{border-radius:10px;}
.app-login .login img{width:30px;height:30px;margin:0 5px;}

</style>