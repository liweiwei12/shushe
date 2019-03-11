import Vue from 'vue'
import Router from 'vue-router'
import home from "./components/home/home.vue"
import login from "./components/home/login.vue"
import user from "./components/user/user.vue"
import myadmin from "./components/user/myadmin.vue"
import setting from "./components/user/setting.vue"
import userinfo from "./components/user/userinfo.vue"
import search from "./components/books/search.vue"
import register from "./components/user/register.vue"
import bookcart from "./components/books/bookcart.vue"
import chat from "./components/books/chat.vue"
import chatwindow from "./components/books/chatwindow.vue"
import details from "./components/books/details.vue"
import test from "./test.vue"
Vue.use(Router)
export default new Router({
  routes: [
    {path:'/',component:home},
    {path:"/login",component:login},
    {path:"/user",component:user},
    {path:"/myadmin",component:myadmin},
    {path:"/setting",component:setting},
    {path:"/userinfo",component:userinfo},
    {path:"/search",component:search},
    {path:"/register",component:register},
    {path:"/bookcart",component:bookcart},
    {path:"/chat",component:chat},
    {path:"/chatwindow",component:chatwindow},
    {path:"/details",component:details},
    {path:"/test",component:test}
  ]
})
