<template>
    <div class="app-home">
        <header>
            <img src="../../img/logo1.png">
            <input type="text" placeholder="更多好书" @focus="fc">
            <img src="../../img/sao.png" class="search">
        </header>
        <mt-swipe :auto="4000">
            <mt-swipe-item v-for="a in list" :key="a.cid">
                <img :src="a.pic" alt="">
            </mt-swipe-item>
        </mt-swipe>
        <div class="mui-content">
            <table></table>
		    <ul class="mui-table-view mui-grid-view mui-grid-9 nav9">
		        <li class="mui-table-view-cell mui-media mui-col-xs-3 mui-col-sm-3">
                    <router-link to="#">
		            <img src="../../img/hot.png" alt="">
		            <div class="mui-media-body">畅销书</div>
                    </router-link>
                </li>
		        <li class="mui-table-view-cell mui-media mui-col-xs-3 mui-col-sm-3">
                    <router-link to="#">
                        <img src="../../img/ebook.png" alt="">
                        <div class="mui-media-body">电子书</div>
                    </router-link>
                </li>
		        <li class="mui-table-view-cell mui-media mui-col-xs-3 mui-col-sm-3">
                    <router-link to="#">
		                <img src="../../img/tuan.png" alt="">
		                <div class="mui-media-body">团购</div>
                    </router-link>
                </li>
		        <li class="mui-table-view-cell mui-media mui-col-xs-3 mui-col-sm-3">
                    <router-link to="#">
		                <img src="../../img/sale.png" alt="">
		                <div class="mui-media-body">限时秒杀</div>
                    </router-link>
                </li>
		        <li class="mui-table-view-cell mui-media mui-col-xs-3 mui-col-sm-3">
                    <router-link to="#">
		                <img src="../../img/tui.png" alt="">
		                <div class="mui-media-body">好书推荐</div>
                    </router-link>
                </li>
		        <li class="mui-table-view-cell mui-media mui-col-xs-3 mui-col-sm-3">
                    <router-link to="#">
		                <img src="../../img/order.png" alt="">
		                <div class="mui-media-body">排行榜</div>
                    </router-link>
                </li>
		        <li class="mui-table-view-cell mui-media mui-col-xs-3 mui-col-sm-3">
                    <router-link to="#">
		                <img src="../../img/live1.png" alt="">
		                <div class="mui-media-body">直播</div>
                    </router-link>
                </li>
		        <li class="mui-table-view-cell mui-media mui-col-xs-3 mui-col-sm-3">
                    <router-link to="#">
		                <img src="../../img/huo.png" alt="">
		                <div class="mui-media-body">活动</div>
                    </router-link>
                </li>
		    </ul> 
		</div>
        <div class="ad"><img src="../../img/06.png" alt=""></div>
        <div class="goods">
            <div class="mui-card good" v-for="item in arr" :key="item.bid"  @click="a">
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
        <div style="font-size:15px;text-align:center;color:#aaa;" :disabled="ds" @click="more">{{f}}
        </div>
    </div>
</template>
<script>
    export default{
        data(){
            return {
                list:[],
                arr:[],
                pno:0,
                pagesize:6,
                f:"",
                ds:false
            }
        },
        methods:{
             more(){
                this.pno++;
                var url="http://127.0.0.1:3000/more?pno="+this.pno+"&pagesize="+this.pagesize;
                this.axios.get(url).then(result=>{
                 var rows=this.arr.concat(result.data.data);
                 this.arr=rows;
                  if(this.arr.length%this.pagesize==0){
                     this.f="加载更多..."
                 }else{this.f="没有更多了";this.ds=true}
                })
            },
            carousel(){
                var url="http://127.0.0.1:3000/carousel";
                this.axios.get(url).then(result=>{
                   // console.log(result)
                    this.list=result.data.data;
                    //console.log(this.list)
                    })
            },
            fc(){
               this.$router.push("search");
            },
            a(e){
                var did=e.target.dataset.bid;
                //console.log(did)
                this.$router.push("/details?did="+did)
            }
        },
        created(){
          this.more();  
          this.carousel();
        }
    }
</script>
<style>
.app-home header{
    width:100%;height:45px;background:#2b363c;position:relative;
}
.app-home header img{
    width:60;height:22px;position:absolute;left:15px;top:14px;
}
.app-home header .search{
    position:absolute;left:335px;top:12px;
}
.app-home header input{
    width:200px;height:25px;border-radius:12px;position:absolute;top:10px;left:105px;font-size:12px;background:#fff url("../../img/search.png") no-repeat 100% 0;background-size:22px 22px;
}
.app-home .mint-header{background:#f33;}
.app-home .mint-swipe{height:202px;}
.app-home .mint-swipe img{width:100%;height:200px;}
.app-home .mui-content{margin:0;}
.app-home .mui-content .nav9{margin:0;}
.app-home .mui-content .nav9 li{padding:0 15px;}
.app-home .mui-content .nav9 li .router-link-active{padding-top:10px;}
.app-home .mui-grid-9 img{width:45px;height:45px;}
.app-home .goods{
  display:flex;  
  flex-wrap:wrap; 
  justify-content:space-between;
  padding:4px;
  min-height:200px;
 }
 .app-home .goods .good{
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
 .app-home .goods img.pic{
 width:100%;height:130px;
}
.app-home .goods p{
  font-size:12px;
  margin:10px 0 0 0;
} 
  .app-home .ad>img{width:95%;height:30px;margin:10px 0;border-radius:5px;}
  .app-home .ad{text-align:center;}
</style>