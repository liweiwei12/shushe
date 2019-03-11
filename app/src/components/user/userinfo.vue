<template>
    <div class="text">
        <mt-header title="个人信息" fixed style="background:#2b363c;color:#1de8b3;font-size:16px;">
        <router-link to="/setting" slot="left">
        <mt-button icon="back">返回</mt-button>
        </router-link>
        <mt-button icon="more" slot="right"></mt-button>
        </mt-header>
				<div class="mui-scroll-wrapper" style="top:42px;">
					<div class="mui-scroll">
						<ul class="mui-table-view">
							<li class="mui-table-view-cell">
								<a id="head" class="mui-navigate-right">头像
								<span class="mui-pull-right head">
									<img class="head-img mui-action-preview" id="head-img1" src="../../img/smile1.png" style="width:30px;height:30px;border-radius:50%;margin-right:18px;"/>
								</span>
							</a>
							</li>
							<li class="mui-table-view-cell">
								<a>姓名<span class="mui-pull-right">Hbuilder</span></a>
							</li>
							<li class="mui-table-view-cell">
								<a>HBuilder账号<span class="mui-pull-right">hbuilder@dcloud.io</span></a>
							</li>
						</ul>
						<ul class="mui-table-view">
							<li class="mui-table-view-cell">
								<a>QQ号<span class="mui-pull-right">88888888</span></a>
							</li>
							<li class="mui-table-view-cell">
								<a>手机号<span class="mui-pull-right">18601234567</span></a>
							</li>
							<li class="mui-table-view-cell">
								<a>邮箱地址<span class="mui-pull-right">hbuilder@dcloud.io</span></a>
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
            }
        }
    }
</script>
<style>
   
</style>
