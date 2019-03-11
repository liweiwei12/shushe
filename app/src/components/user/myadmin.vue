<template>
    <div class="app-user">
        <mt-header title="我的书舍" fixed style="background:#2b363c;color:#1de8b3;font-size:16px;"></mt-header>
            <div class="mui-table-view mui-table-view-chevron" style="height:84px;">
                <div style="position:absolute;"><img src="../../img/bg.png" alt="" style="width:375px; height:84px;"></div>
						<div style="position:absolute"><img class="mui-media-object mui-pull-left" src="../../img/smile1.png" style="border-radius:50%;border:2px solid #ddd;margin:15px 15px 0 15px;">
						<div class="mui-media-body" style="width:290px;margin-top:15px;">
							<span style="color:#fff;">WEWE</span><img class="mui-media-object mui-pull-right" src="../../img/set.png" style="width:25px;height:25px;margin-top:10px;">
							<p class='mui-ellipsis' style="color:#fff">心情：这个人很懒
                            </p>
						</div>
                        </div>
			</div>
            <ul class="mui-table-view mui-table-view-chevron" >
				<li class="mui-table-view-cell mui-media" style="padding:11px 15px;text-align:center;" >
                    <ul style="list-style:none;padding-left:0;">
                        <li style="float:left;margin:0 15px;">
                        <img class="mui-media-object " src="../../img/like.png" style="width:25px;height:25px;margin:10px 15px 0 15px;">
                        <h6>待付款</h6>
                        </li>
                         <li style="float:left;margin:0 15px;">
                        <img class="mui-media-object " src="../../img/like.png" style="width:25px;height:25px;margin:10px 15px 0 15px;">
                        <h6>待收货</h6>
                        </li>
                        <li style="float:left;margin:0 15px;">
                        <img class="mui-media-object " src="../../img/like.png" style="width:25px;height:25px;margin:10px 15px 0 15px;">
                        <h6>待评价</h6>
                        </li>
                         <li style="float:left;margin:0 15px;">
                        <img class="mui-media-object " src="../../img/like.png" style="width:25px;height:25px;margin:10px 15px 0 15px;">
                        <h6>退货/售后</h6>
                        </li>
                    </ul>
                    <table></table>
				</li>
                <li class="mui-table-view-cell mui-media" style="padding:11px 15px;text-align:center;" >
                    <ul style="list-style:none;width:375px;padding-left:0;min-height:64px;">
                        <li style="float:left;margin:0 15px;">
                        <img class="mui-media-object " src="../../img/like.png" style="width:25px;height:25px;margin:10px 15px 0 15px;">
                        <h6>待付款</h6>
                        </li>
                         <li style="float:left;margin:0 15px;">
                        <img class="mui-media-object " src="../../img/like.png" style="width:25px;height:25px;margin:10px 15px 0 15px;">
                        <h6>待收货</h6>
                        </li>
                         <li style="float:left;margin:0 15px;">
                        <img class="mui-media-object " src="../../img/like.png" style="width:25px;height:25px;margin:10px 15px 0 15px;">
                        <h6>待评价</h6>
                        </li>
                         <li style="float:left;margin:0 15px;">
                        <img class="mui-media-object " src="../../img/like.png" style="width:25px;height:25px;margin:10px 15px 0 15px;">
                        <h6>退货/售后</h6>
                        </li>
                    </ul>
				</li>
			</ul>
            <h5 style="text-align:center;margin-top:15px;">———— 好书推荐 ————</h5><br>
            <div class="mui-card goods">
			<div class="mui-card-header mui-card-media" style="height:40vw;"><img src="../../img/B3.jpg" alt="" class="pic"></div>
			<div class="mui-card-content">
			    <div class="mui-card-content-inner">
				    <p>这里显示文章摘要，让读者对文章</p>
				    <p style="color: #333;">￥180.22</p>
			    </div>
			</div>
		</div>
        
        <div class="mui-card goods1">
			<div class="mui-card-header mui-card-media" style="height:40vw;"><img src="../../img/B2.jpg" class="pic" alt=""></div>
			<div class="mui-card-content">
				<div class="mui-card-content-inner">
					<p>这里显示文章摘要，让读者对文章</p>
					<p style="color: #333;">￥12.99 </p>
				</div>
			</div>
		</div>
        <div class="mui-card goods">
			<div class="mui-card-header mui-card-media" style="height:40vw;"><img src="../../img/B3.jpg" alt="" class="pic"></div>
			<div class="mui-card-content">
			    <div class="mui-card-content-inner">
				    <p>这里显示文章摘要，让读者对文章</p>
				    <p style="color: #333;">￥180.22</p>
			    </div>
			</div>
		</div>
        
        <div class="mui-card goods1">
			<div class="mui-card-header mui-card-media" style="height:40vw;"><img src="../../img/B2.jpg" class="pic" alt=""></div>
			<div class="mui-card-content">
				<div class="mui-card-content-inner">
					<p>这里显示文章摘要，让读者对文章</p>
					<p style="color: #333;">￥12.99 </p>
				</div>
			</div>
            </div>
        </div>
    </div>
</template>
<script>
    export default{
        data(){
            return {}
        },
        methods:{

        },
        created(){

        }
    }
</script>
<style>
    .app-user .goods{
  width:49%;
  border:1px solid #ccc;
  box-shadow:0 0 8px #ccc;
  margin:4px 1px;
  float:left;
  min-height:180px;
 }
 .app-user .goods1{
  width:49%;
  border:1px solid #ccc;
  box-shadow:0 0 8px #ccc;
  margin:4px 1px;
  float:right;
  min-height:180px;
 }
 .app-user .mui-card img.pic{width:161px;height:130px;}
</style>