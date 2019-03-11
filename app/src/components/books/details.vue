<template>
    <div class="app-details">
       <mt-header title="商品详情" fixed style="background:#2b363c;color:#1de8b3;font-size:16px;">
       </mt-header>
       <div class="mui-card">
            <mt-swipe :auto="4000">
                <mt-swipe-item v-for="item in list" :key="item.cid">
                    <img :src="item.pic" alt="">
                </mt-swipe-item>
            </mt-swipe>
        </div>
        <div class="mui-card">
			<div class="mui-card-content" v-for="item in arr">
				<div class="mui-card-content-inner" style="font-size:18px;margin:10px 0;padding-bottom:8px;">
					<span style="color:#1ed8b3;border:1px solid #1ed8b3;padding:5px;border-radius:5px;">￥{{item.price}}
                    </span>
                    <span style="color:#aaa;font-size:12px;margin:0 10px;">
                    <del >￥{{(item.price*1.25).toFixed(2)}}</del>
                    </span>
                    <span style="font-size:13px;margin-left:100px;">{{item.adr}}<img src="../../img/my.png" alt="" style="width:25px;margin-left:20px;height:25px;" @click="b"></span>
				</div>
                <div class="mui-card-content-inner" style="padding-top:0;">{{item.bname}}
                </div>
            </div>
        </div>
        <div class="mui-card">
			<div class="mui-card-content">
				<div class="mui-card-content-inner" style="font-size:18px;margin:0 5px;padding-bottom:8px;">
                <a href="#param"><button style="width:30%;background:#2b363c;color:#fff;margin:0 5px;">参数</button></a>
                <a href="#detail"><button style="width:30%;background:#1ed8b3;color:#fff;margin:0 5px;">详情</button></a>
                <a href="#tj"><button style="width:30%;background:#2b363c;color:#fff;margin:0 5px;">推荐</button></a>
                </div>
            </div>
            <hr>
            <div v-for="b in row">
                <div class="mui-card-content" id="param">
                    <img :src="b.param" alt="" style="width:100%;height:150px;">
                </div>
                <div class="mui-card-content" id="detail">
                    <img :src="b.detail" alt="" style="width:100%;height:100%;">
                </div>
            </div>
            <div class="mui-card-content" id="tj">
				<div class="mui-card-content-inner" style="font-size:18px;margin:0 5px;padding-bottom:8px;">
                    <div class="goods" id="tj">
            <div class="mui-card good" v-for="item in li" :key="item.bid"  @click="more">
                <div class="mui-card-header mui-card-media">
                    <img :src="item.pic" :data-bid="item.bid" alt="" class="pic">
                </div>
                <div class="mui-card-content">
                    <div class="mui-card-content-inner" >
                        <p :data-bid="item.bid">{{item.bname}}</p>
                        <p style="color: #333;" :data-bid="item.bid">￥{{item.price}}</p>
                    </div>
                </div>
            </div>
        </div>
                </div>
            </div>

        </div>
        <div style="font-size:15px;text-align:center;color:#aaa;" @click="more">加载更多...</div>
        <div style="height:100px;"></div>
        <div style="position:fixed;background:#1ed8b3;width:100%;padding:8px 15px;bottom:50px;">
               <img src="../../img/save1.png" alt="" style="width:15px;height:15px;"> 
               <span style="font-size:14px;margin:0 10px;">收藏</span>
               <img src="../../img/good1.png" alt="" style="width:15px;height:15px;margin-top:6px;"> 
               <span style="font-size:14px;margin-left:10px;">赞</span>
               <button @click="addcart" style="background:#2b363c;border-top-left-radius:15px;border-bottom-left-radius:15px;border:none;color:#1de8b3;margin-left:40px;">加入购物车({{count}})
               </button>
               <button style="background:#fff;border:none;color:#1de8b3;border-top-right-radius:15px;border-bottom-right-radius:15px;"><router-link to="/bookcart" style="color:#1de8b3">去购物车</router-link></button>
            </div>
    </div>
</template>
<script>
    export default{
        data(){
            return {
               list:[],
               arr:[],
               row:[],
               li:[],
                pno:0,
                pagesize:6,
                count:0
            }
        },
        methods:{
            ride(){
                var did=this.$route.query.did;
                var url="http://127.0.0.1:3000/ride?did="+did;
                this.axios.get(url).then(result=>{
                    this.list=result.data.data;
                })
            },
            a(){
               var did=this.$route.query.did;
                var url="http://127.0.0.1:3000/info?did="+did;
                this.axios.get(url).then(result=>{
                    this.result;
                    this.arr=result.data.data;
                    console.log(this.arr)
                }) 
            },
            details(){
                 var did=this.$route.query.did;
                var url="http://127.0.0.1:3000/details?did="+did;
                this.axios.get(url).then(result=>{
                    this.row=result.data.data;
                    //.log(this.row)
                }) 
            },
             more(){
                this.pno++;
                var url="http://127.0.0.1:3000/more?pno="+this.pno+"&pagesize="+this.pagesize;
                this.axios.get(url).then(result=>{
                 var rows=this.li.concat(result.data.data);
                 this.li=rows;
                 //console.log(this.arr)
                })
            },
            addcart(){
                 var did=this.$route.query.did;
                 console.log(did)
                 var url="http://127.0.0.1:3000/addcart?did="+did;
                this.axios.get(url).then(result=>{
                    this.add=result.data.code;
                    if(this.add==1){
                        this.count+=1;
                    }
                }) 
            },
            b(){
                this.$router.push("/chatwindow")
            }
            },
        created(){
            this.ride();
            this.a();
            this.details();
             this.more();
        }
    }
</script>
<style>
   .app-details .mint-swipe{height:202px;}
.app-details .mint-swipe img{width:100%;height:202px;} 
.app-details .goods{
  display:flex;  
  flex-wrap:wrap; 
  justify-content:space-between;
  padding:4px;
  min-height:200px;
 }
 .app-details .goods .good{
     width:49%;   /*商品项宽度*/
  border:1px solid #ccc;/*边框*/
  box-shadow:0 0 8px #ccc;/*阴影*/
  margin:4px 0;
  padding:2px;
  display:flex;/*子元素弹性布局*/
  flex-direction:column;/*排列方式:垂直*/
  min-height:200px;
  justify-content:space-between;
 }
 .app-details .goods img.pic{
 width:100%;height:130px;
}
.app-details .goods p{
  font-size:12px;
  margin:10px 0 0 0;
} 
</style>