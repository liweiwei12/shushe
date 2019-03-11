//app.js
//1:加载模块 express pool.js
const express = require("express");
const pool = require("./pool");
const qs=require("qs")

const bodyParser=require("body-parser");
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
app.use(bodyParser.urlencoded({extended:false}));
app.use(cors({
  origin:["http://127.0.0.1:8080",
  "http://localhost:8080"],
  credentials:true
}));
const session=require("express-session");
app.use(session({
  secret:"128位随机字符",
  resave:false,
  saveUninitialized:true,
  cookie:{
    maxAge:1000*60*60*8
  }
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
app.get("/ride",(req,res)=>{
  var did=req.query.did;
  sql="select pic,cid from ss_books_pic where pid=?";
  pool.query(sql,[did],(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      res.send({code:1,data:result})
    }else{
      res.send({code:-1,msg:"无此商品"})
    }
  })
})
app.get("/info",(req,res)=>{
  var bid=req.query.did;
  sql="select bname,price,adr from ss_index_books where bid=?";
  pool.query(sql,[bid],(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      res.send({code:1,data:result})
    }else{
      res.send({code:-1,msg:"无此商品"})
    }
  })
})
app.get("/details",(req,res)=>{
  var did=req.query.did;
  sql="select did,pid,detail,param from ss_details where did=?";
  pool.query(sql,[did],(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      res.send({code:1,data:result})
    }else{
      res.send({code:-1,msg:"无此商品"})
    }
  })
})
app.get("/addcart",(req,res)=>{
  var pid=req.query.did;
  //console.log(pid)
  var counts=1;
  //console.log(counts)
  var sql=`select pid from ss_book_cart where pid=${pid} and uid=1`;
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      var sql=`UPDATE ss_book_cart SET counts=counts+1 WHERE pid=${pid} and uid=1`;
    }else{
      var sql=`INSERT INTO ss_book_cart VALUES(null,${pid},${counts},1)`;
    };
    pool.query(sql,(err,result)=>{
      if(err) throw err;
      if(result.affectedRows>0){
        //console.log("插入成功")
        res.send({code:1,msg:"加入成功"})
      }else{
       // console.log("插入失败")
        res.send({code:-1,msg:"加入失败"})
      }
    })
  })
})
app.get("/shopcart",(req,res)=>{
  var sql="select r.id,r.pid,r.counts,b.price,b.price,b.bname,b.pic from ss_book_cart r,ss_index_books b where r.pid=b.bid";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      res.send({code:1,data:result})
    }else{
      res.send({code:-1,msg:"购物车竟然是空的"})
    }
  })
})
app.get("/add",(req,res)=>{
  var a=req.query.a;
  var pid=req.query.pid;
  var sql="";
  if(a==1){sql="update ss_book_cart set counts=counts+1 where pid=? and uid=1";}else{sql="update ss_book_cart set counts=counts-1 where pid=? and uid=1";}
  pool.query(sql,[pid],(err,result)=>{
    if(err)throw err;
    if(result.affectedRows>0){
      res.send({code:1})
    }else{
      res.send({code:-1})
    }
  })
})
app.get("/remove",(req,res)=>{
  var ids=req.query.ids;
  var sql=`delete from ss_book_cart where id in (${ids})`;
  pool.query(sql,(err,result)=>{
    if(err)throw err;
    if(result.affectedRows>0){
      res.send({code:1,msg:"删除成功"})
    }else{res.send({code:-1,msg:"删除失败"})}
  })
})
app.get("/search",(req,res)=>{
  var key=req.query.key;
  var pno=req.query.pno;
  var pagesize=req.query.pagesize;
  if(!pno){pno=1};
  if(!pagesize){pagesize=7};
  var page=parseInt(pagesize);
  var ps=(pno-1)*page;
  var sql=`select bid,bname,price,pic from ss_index_books where bname like "%${key}%" limit ${ps},${page}`;
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      res.send({code:1,data:result})
    }else{
      res.send({code:-1,msg:"没有更多商品"})
    }
  })
});
app.get("/chat",(req,res)=>{
  var sql=`select uid,uname,avatar from ss_book_user where uid=1`;
  pool.query(sql,(err,result)=>{
    if(err)throw err;
    if(result.length>0){
      res.send({code:1,data:result})
    }else{res.send({code:-1,msg:"无此用户"})}
  })
})
app.get("/send",(req,res)=>{
  var msg=req.query.msg;
  var sql="insert into ss_chat_msg values(null,?)";
  pool.query(sql,[msg],(err,result)=>{
    if(err) throw err;
    if(result.affectedRows>0){
      res.send({code:1,msg:"发送成功"})
    }else{res.send({code:-1,msg:"发送失败"})}
  })
})
app.post("/register",(req,res)=>{
  var uname=req.body.uname;
  var pwd=req.body.pwd;
  var phone=req.body.phone;
  var email=req.body.email;
  var sql="select uname from ss_register where uname=?";
  pool.query(sql,[uname],(err,result)=>{
    if(err)throw err;
    if(result.length>0){
      res.send({code:-1,msg:"该用户名已被占用"})
    }else{
      var sql="insert into ss_register values(null,?,md5(?),?,?)";
      pool.query(sql,[uname,pwd,phone,email],(err,result)=>{
        if(err)throw err;
        if(result.affectedRows>0){
          res.send({code:1,msg:"注册成功"})
        }else{res.send({code:-1,msg:"注册失败"})}
      })
    }
  })
  
})
app.post("/login",(req,res)=>{
  var uname=req.body.uname;
  var pwd=req.body.pwd;
  var sql="select uid,uname,pwd from ss_register where uname=? && pwd=md5(?)";
  pool.query(sql,[uname,pwd],(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      var id=result[0].uid;
      req.session.uid=id;
      res.send({ code:1,msg:"登录成功"})
    }else{
      res.send({code:-1,msg:"登录失败"})
    }
  })
})
app.get("/get",(req,res)=>{
  if(!req.session.uid){
    res.send({code:-1,msg:"请登录"});return;
  }
  var uid=req.session.uid;
  var sql="select uname from ss_register where uid=?";
  pool.query(sql,[uid],(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      res.send({code:1,data:result})
    }else{res.send({code:-1,msg:"系统错误"})
  }})
})
app.get("/count",(req,res)=>{
  if(!req.session.uid){res.send({code:-1,msg:"请登录"});return}
  var uid=req.session.uid;
  var sql="select counts from ss_book_cart where uid=?";
  pool.query(sql,[uid],(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      res.send({code:1,data:result})
    }else{res.send({code:-1,msg:"系统错误"})}
  })
})
app.get("/quit",(req,res)=>{
  if(req.session.uid){
    req.session.uid=null;
  }
  res.send({code:1,msg:"注销"})
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
