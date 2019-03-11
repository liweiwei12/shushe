<template>
<div class="app-chat">
    <mt-header title="消息" fixed style="background:#2b363c;color:#1de8b3;font-size:16px;">
    </mt-header>
    <ul class="mui-table-view">
		<li class="mui-table-view-cell mui-media" v-for="item in arr"  :key="item.uid">
			<router-link to="/chatwindow">
				<img class="mui-media-object mui-pull-left" :src="item.avatar" style="border-radius:50%;">
				<div class="mui-media-body">
					{{item.uname}}<span class="mui-pull-right" style="font-size:12px;color:#aaa;">{{item.uname}}</span>
					<p class='mui-ellipsis'>{{item.uname}}</p>
				</div>
			</router-link>
		</li>
	</ul>
</div>
</template>
<script>
    export default{
        data(){
			return{
				arr:[]
			}
        },
		methods:{
			chat(){
				var uid=1;
				var url="http://127.0.0.1:3000/chat?uid="+uid;
				this.axios.get(url).then(result=>{
					this.arr=result.data.data;
					console.log(this.arr)
				})
			}
		},
		created(){
			this.chat();
		}
    }
</script>
<style>
    
</style>