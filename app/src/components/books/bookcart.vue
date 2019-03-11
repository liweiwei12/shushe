<template>
    <div class="app-bookcart">
        <mt-header fixed title="购物车" style="background:#2b363c;color:#1de8b3;font-size:16px;">
        </mt-header>
        <ul class="mui-table-view">
			<li class="mui-table-view-cell mui-media" style="min-height:90px;" v-for="(item,i) in list" :key="item.id">
				<a href="javascript:;">
                    <input type="checkbox" :checked="item.cb" @click="sel"  :data-i="i" class="mui-pull-left" style="margin:35px 10px 0 0">
					<img class="mui-pull-left" :src="item.pic" style="width:80px;height:80px;">
					<div class="mui-media-body class=mui-ellipsis" style="width:242px;">
					<p style="margin:15px 10px;font-size:12px;overflow:hidden;text-overflow:ellipsis;">{{item.bname}}
					</p> 
					<p class='mui-ellipsis' style="margin:15px 10px;font-size:12px;">￥{{item.price}}<del style="color:#ddd;font-size:12px;">￥{{(item.price*1.15).toFixed(2)}}</del>
					<span class="mui-numbox mui-pull-right" style="height:20px;width:60px;padding:0;margin-left:10px;">
					<button class="mui-btn mui-btn-numbox-minus" type="button" @click="count" style="width:20px;" :data-pid="item.pid" :data-counts="item.counts" :disabled="item.da" :data-i="item.i">-
					</button>
					<input class="mui-input-numbox" type="number" :value="item.counts" style="font-size:12px;"/>
					<button class="mui-btn mui-btn-numbox-plus" type="button" @click="count1" style="width:20px;" :data-pid="item.pid" >+
					</button>
					</span>
					</p>
					</div>
				</a>
			</li>
            <li class="mui-table-view-cell mui-media ">
            <button class="mui-pull-right" @click="remove">删除选中的商品</button>
			</li>
		</ul>
		<div style="text-align:center;color:#aaa;font-size:14px;margin:8px;">————好书推荐————</div>
		<div class="goods">
            <div class="mui-card good" v-for="item in arr" :key="item.bid">
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
        <div style="font-size:15px;text-align:center;color:#aaa;" @click="more">加载更多...
        </div>
		<div style="height:45px;"></div>
        <div style="position:fixed;bottom:49px;height:40px;width:100%;background:#fff;">
		<input type="checkbox" style="margin:11px 10px;" :checked="checkedall" @click="selectall">
		<span style="font-size:15px;color:#aaa;margin:2px 0">全选
		</span> 
		<span style="margin-left:35px;">小计:￥{{f.toFixed(2)}}
		</span>
		<button style="background:#1de8b3;height:40px;float:right;border:none;">去结算({{h}})
		</button> 
        </div>
    </div>
</template>
<script>
import {Toast} from 'mint-ui'
    export default{
        data(){
            return {
				arr:[],
                list:[],
				pno:0,
                pagesize:6,
                checkedall:false,
                h:0,
                f:0
			}
        },
		methods:{
            count1(e){
                var pid=e.target.dataset.pid;
                var a=1;
                var url="http://127.0.0.1:3000/add?pid="+pid+"&a="+a;
                this.axios.get(url).then(result=>{
                   if(result.data.code==1) Toast("添加成功");
                 this.shopcart();
                })
            },
            count(e){
                var pid=e.target.dataset.pid;
                 var idx=e.target.dataset.i;
                var counts=e.target.dataset.counts;
               if(counts>=2){
                var a=-1;
                var url="http://127.0.0.1:3000/add?pid="+pid+"&a="+a;
                this.axios.get(url).then(result=>{
                   if(result.data.code==1)Toast("删除成功");
                   this.shopcart();
                })
                }
            },
			shopcart(){
				var url="http://127.0.0.1:3000/shopcart"
				this.axios.get(url).then(result=>{
					this.list=result.data.data;
                   // console.log(this.list)
				})
			},
			more(){
                this.pno++;
                var url="http://127.0.0.1:3000/more?pno="+this.pno+"&pagesize="+this.pagesize;
                this.axios.get(url).then(result=>{
                 var rows=this.arr.concat(result.data.data);
                 this.arr=rows;
                 //console.log(this.arr)
                })
            },
            selectall(e){
                var cb=e.target.checked;
                this.checkedall=cb;
                var b=0; var d=0;
                for(var a of this.list){
                      a.cb=cb;
                      if(a.cb){
                          d+=a.counts*1;
                        var c=a.price*a.counts;
                        b+=c}
                    }
                    this.f=b;
                    this.h=d;
            },
            sel(e){
                var idx=e.target.dataset.i;
                this.list[idx].cb=e.target.checked;
                var a=0;var b=0;var d=0;
                for(var key of this.list){
                    if(key.cb){
                        a++;
                        d+=key.counts*1;
                        b+=key.price*key.counts;
                       }
                    if(a==this.list.length){this.checkedall=true}else{this.checkedall=false}
                }
                this.f=b;
                this.h=d
            },
            remove(){
                var html="";
                for(var a  of  this.list){
                    if(a.cb){
                        html+=a.id+",";
                    }
                }
                var ids=html.substring(0,html.length-1);
                console.log(ids);
                var url="http://127.0.0.1:3000/remove?ids="+ids;
                this.axios.get(url).then(result=>{
                    if(result.data.code==1){
                        Toast("删除成功");
                        this.shopcart();
                    }
                })
            }
		},
		created(){
			this.more();
            this.shopcart();
		}
    }
</script>
<style >
   .app-bookcart .goods{
  display:flex;  
  flex-wrap:wrap; 
  justify-content:space-between;
  padding:4px;
  min-height:200px;
 }
 .app-bookcart .goods .good{
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
 .app-bookcart .goods img.pic{
 width:100%;height:130px;
}
.app-bookcart .goods p{
  font-size:12px;
  margin:10px 0 0 0;
}  
</style>