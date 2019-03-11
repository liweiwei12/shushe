//app.js
//1:加载模块 express pool.js
const express = require("express");
const pool = require("./pool");
//2:创建服务器端对象
var app = express();
//3:监听 3000
app.listen(3000);
//4:指定静态目录  public 
app.use(express.static("public"));
const cors = require("cors");
//6:配置跨域访问模块 那个域名跨域访问允许
//  脚手架8080允许
//origin      允许跨域访问域名列表
//credentials 跨域访问保存session id
app.use(cors({
  origin:["http://127.0.0.1:8080",
  "http://localhost:8080"],
  credentials:true
}));
//功能一:home 组件轮播图片
app.get("/carousel",(req,res)=>{
  var sql="select cid,pic from ss_index_carousel";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      res.send({code:1,data:result})
    }else{
      res.send({code:-1,msg:"竟然是空的"})
    }
  })
});
app.get("/more",(req,res)=>{
  var pno=req.query.pno;
  var pageSize=req.query.pageSize;
  if(!pno){
    pno = 1;
  }
  if(!pageSize){
    pageSize = 6;
  }
  var ps=parseInt(pageSize);
  var page=(pno-1)*ps;
  var sql="select bid,bname,price,pic from ss_index_books limit ?,?";
  pool.query(sql,[page,ps],(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      res.send({code:1,data:result})
    }else{
      res.send({code:-1,msg:"没有更多商品"})
    }
  })
})
app.get("/details",(req,res)=>{
  var did=req.query.did;
  sql="select p.pic,p.cid,d.detail,d.param,d.did from ss_books_pic p,ss_details d where d.pid=p.pid && d.pid=?";
  pool.query(sql,[did],(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      res.send({code:1,data:result})
    }else{
      res.send({code:-1,msg:"无此商品"})
    }
  })
})
  /* 1:将轮播图中所需图片 复制public/img
   2:查询
   var list = [
     {id:1,img_url:"http://127.0.0.1:3000/img/banner1.png"},
     {id:2,img_url:"http://127.0.0.1:3000/img/banner2.png"},
     {id:3,img_url:"http://127.0.0.1:3000/img/banner3.png"},
     {id:4,img_url:"http://127.0.0.1:3000/img/banner4.png"},
   ];
   res.send(list); 
});
服务器项目目录
vue_server_00
   public
   pool.js
db.sql app.js */
