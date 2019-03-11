<template>
    <div class="text">
        <mt-header title="设置" fixed style="background:#2b363c;color:#1de8b3;font-size:16px;">
        <router-link to="/user" slot="left">
        <mt-button icon="back">返回</mt-button>
        </router-link>
        <mt-button icon="more" slot="right"></mt-button>
        </mt-header>
				<div class="mui-scroll-wrapper" style="top:42px;">
					<div class="mui-scroll">
						<ul class="mui-table-view mui-table-view-chevron">
							<li class="mui-table-view-cell mui-media">
								<router-link class="mui-navigate-right" to="/userinfo">
									<img class="mui-media-object mui-pull-left head-img" id="head-img" src="../../img/smile1.png" style="border-radius:50%;">
									<div class="mui-media-body">
										Hello MUI
										<p class='mui-ellipsis'>账号:hellomui</p>
									</div>
								</router-link>
							</li>
						</ul>
						<ul class="mui-table-view mui-table-view-chevron">
							<li class="mui-table-view-cell">
								<a href="#account" class="mui-navigate-right">账号与安全</a>
							</li>
						</ul>
						<ul class="mui-table-view mui-table-view-chevron">
							<li class="mui-table-view-cell">
								<a href="#notifications" class="mui-navigate-right">新消息通知</a>
							</li>
							<li class="mui-table-view-cell">
								<a href="#privacy" class="mui-navigate-right">隐私</a>
							</li>
							<li class="mui-table-view-cell">
								<a href="#general" class="mui-navigate-right">通用</a>
							</li>
						</ul>
						<ul class="mui-table-view mui-table-view-chevron">
							<li class="mui-table-view-cell">
								<a href="#about" class="mui-navigate-right">关于MUI <i class="mui-pull-right update">V3.1.0</i></a>
							</li>
						</ul>
						<ul class="mui-table-view">
							<li class="mui-table-view-cell" style="text-align: center;">
								<a @click="quit">{{a}}</a>
							</li>
						</ul>
					</div>
				</div>
		</div>	

</template>
<script>
    export default{
        data(){
            return {
				a:"退出登录"
            }
        },
		methods:{
			quit(){
				var url="http://127.0.0.1:3000/quit";
				this.axios.get(url).then(result=>{
					console.log(result)
					if(result.data.code==1){
						this.$router.push("user")
					}
				})
			}
		}
    }
</script>
<style>
   
</style>
