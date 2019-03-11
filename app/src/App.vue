<template>
 <div class="app-container">
    <router-view></router-view>
    <nav class="mui-bar mui-bar-tab">
			<router-link class="mui-tab-item mui-active" to="/">
				<img class="mui-icon" src="./img/home1.png" alt="">
			</router-link>
            <router-link class="mui-tab-item" to="/chat">
				<img class="mui-icon" src="./img/dialog.png" alt="">
			</router-link>
			<router-link class="mui-tab-item" to="/bookcart">
				<span class="mui-icon"><img class="mui-icon" src="./img/bookcart.png" alt=""><span class="mui-badge" style="background:#1de8b3;">{{count}}</span></span>
			</router-link>
			<router-link class="mui-tab-item" to="/user">
				<img class="mui-icon" src="./img/my1.png" alt="">
			</router-link>
		</nav>
 </div>
</template>
<script>
    export default{
        data(){
            return {
                count:0
            }
            },
        methods:{
            counts(){
                var url="http://127.0.0.1:3000/count";
                this.axios.get(url).then(result=>{
                    for(var item of result.data.data){
                        this.count+=item.counts/1;
                    }
                })
            }
        },
        created(){
           this.counts();
        },
    }
</script>

<style>
   .app-container{
     padding-top:40px;
     padding-bottom:50px;
     overflow-x:hidden;
   }
    .app-container .mint-header{background:red;}
 .mui-bar-tab .mui-tab-item-tao.mui-active {
    color: #007aff;
 }
.mui-bar-tab .mui-tab-item-tao {
    display: table-cell;
    overflow: hidden;
    width: 1%;
    height: 50px;
    text-align: center;
    vertical-align: middle;
    white-space: nowrap;
    text-overflow: ellipsis;
    color: #929292;
}
.mui-bar-tab .mui-tab-item-tao .mui-icon {
    top: 3px;
    width: 24px;
    height: 24px;
    padding-top: 0;
    padding-bottom: 0;
}

.mui-bar-tab .mui-tab-item-tao .mui-icon~.mui-tab-label {
   font-size:11px;
   display:block;
   overflow:hidden;
   text-overflow:ellipsis;

}
.app-container nav.mui-bar{background:#2b363c;}
.app-container{margin:0;}
</style>
