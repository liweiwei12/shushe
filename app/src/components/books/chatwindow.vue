<template>
    <div class="app-chatwindow">
        <header class="mui-bar mui-bar-nav" style="background:#1de8b3;">
			<router-link class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left" to="/chat"></router-link>
			<h1 class="mui-title" style="color:#fff;">chat ({{a}})</h1>
		</header>
		<div class="mui-content">
			<div id='msg-list'>
				<div style="float:right">
					<div style="display:inline-block;font-size:10px;"><p style="background:#1de8b3;border-radius:5px;padding:8px;margin-right:5px;vertical-align=top;margin-top:5px;color:#fff;">{{c}}</p></div>
					<img :src="b" style="width:45px;height:45px;float:right;" />
				</div>
				<table style="clear:both"></table>
			</div>
			<div id='msg-list'>
				<div style="float:left">
					<div style="display:inline-block;font-size:10px;"><p style="background:#1de8b3;border-radius:5px;padding:8px;margin-left:5px;vertical-align=top;margin-top:5px;color:#fff;">{{d}}</p></div>
					<img :src="b" style="width:45px;height:45px;float:left;" />
				</div>
				<table style="clear:both"></table>
			</div>
		</div>
        <footer style="margin:5px 0px;border-top:1px solid #aaa;height:50px;border-bottom:1px solid #aaa;position:relative;bottom:-379px;">
			<div class="footer-left">
				<i id='msg-image' class="mui-icon mui-icon-mic" style="font-size: 28px;float:left;margin:8px 8px;"></i>
			</div>
			<div class="footer-center">
				<textarea id='msg-text' type="text" class='input-text' style="width:268px;float:left;height:40px;margin:4px 0;" v-model="value"></textarea>
				<button id='msg-sound' type="button" class='input-sound' style="display: none;">按住说话</button>
			</div>
			<label class="footer-right">
				<button id='msg-type' style="margin:4px 8px;width:45px;height:40px;padding:0;float:left;background:#1de8b3;color:#fff;" @click="send">发送</button>
			</label>
		</footer>
    </div>
</template>
<script>
    export default{
        data(){
            return {
				arr:[],
				a:'',
				b:"",
				value:"",
				c:"",
				ws:"",
				d:""
			}
        },
		methods:{
		chat(){
				var uid=1;
				var url="http://127.0.0.1:3000/chat?uid="+uid;
				this.axios.get(url).then(result=>{
					this.arr=result.data.data;
					this.a=this.arr[0].uname;
					this.b=this.arr[0].avatar;
					//console.log(this.arr)
				})
			},
		send(){
			var uid=1;
			var url="http://127.0.0.1:3000/send?uid="+uid+"&msg="+this.value;
			this.axios.get(url).then(result=>{
				//console.log(result)
				if(result.data.code==1){
					this.c=this.value;
					this.value="";
				    this.d="客服小姐姐已失联"
					 }
					
			})
			}
		},
		created(){
			this.chat();
		}
    }
</script>
<style>
    .app-chatwindow{height:600px;}
</style>