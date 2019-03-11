<template>
    <div class="app-search">
        <div style="background:#2b363c;position:absolute;top:0;height:45px;" ><input type="text" style="width:300px;height:28px;margin:8px 0 8px 9px;border-top-left-radius:10px;border-color:#fff;border-bottom-left-radius:10px;border-right:none;" v-model="value"><button style="height:28px;margin:8px 8px 0 0;border-top-right-radius:10px;background:#1de8bc;border-bottom-right-radius:10px;border:none;"><span style="color:#fff" @click="search">搜书</span></button> </div>
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
        <div style="font-size:15px;text-align:center;color:#aaa;" @click="more" :disabled="ds">{{f}}
        </div>
    </div>
</template>
<script>
    export default{
        data(){
            return {
				arr:[],
				value:"",
				pno:0,
                pagesize:6,
				ds:false,
				f:""
			}
        },
		methods:{
			a(e){
                var did=e.target.dataset.bid;
                console.log(did)
                this.$router.push("/details?did="+did)
            },
			search(){
                this.pno++;
				var key=this.value;
                var url="http://127.0.0.1:3000/search?pno="+this.pno+"&pagesize="+this.pagesize+"&key="+key;
                this.axios.get(url).then(result=>{
                 var rows=this.arr.concat(result.data.data);
                 this.arr=rows;
                 if(this.arr.length%this.pagesize==0){
                     this.f="加载更多..."
                 }else{this.f="没有更多了";this.ds=true}
                })
            },
            more(){
                this.search();
            }
		},
    }
</script>
<style>
   .app-search .goods{
  display:flex;  
  flex-wrap:wrap; 
  justify-content:space-between;
  padding:4px;
  min-height:200px;
 }
 .app-search .goods .good{
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
 .app-search .goods img.pic{
 width:100%;height:130px;
}
.app-search .goods p{
  font-size:12px;
  margin:10px 0 0 0;
} 
</style>