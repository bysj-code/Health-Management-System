import Vue from 'vue';
import VueRouter from 'vue-router';
import index from '../views/index.vue';
import login from '../views/login.vue';
import forgot from '../views/forgot.vue';
Vue.use(VueRouter)

const routes = [
	// 主页
	{
		path: '/',
		name: 'index',
		component: index,
		meta: {
			index: 0,
			title: '首页'
		}
	},

	// 登录
	{
		path: '/login',
		name: 'login',
		component: login,
		meta: {
			index: 0,
			title: '登录'
		}
	},


	// 忘记密码
	{
		path: '/forgot',
		name: "forgot",
		component: forgot,
		meta: {
			index: 0,
			title: '忘记密码'
		}
	},

	// 修改密码
	{
		path: '/user/password',
		name: "password",
		component: () => import("../views/user/password.vue"),
		meta: {
			index: 0,
			title: '修改密码'
		}
	},

	// 视频播放页
	{
		path: "/media/video",
		name: "video",
		component: () => import('../views/media/video.vue'),
		meta: {
			index: 0,
			title: "视频"
		}
	},

	// 音频播放页
	{
		path: "/media/audio",
		name: "audio",
		component: () => import('../views/media/audio.vue'),
		meta: {
			index: 0,
			title: "音频"
		}
	},

	// 权限路由
	{
		path: '/auth/table',
		name: 'auth_table',
		component: () => import('../views/auth/table.vue'),
		meta: {
			index: 0,
			title: '权限列表'
		}
	},
	{
		path: '/auth/view',
		name: 'auth_view',
		component: () => import('../views/auth/view.vue'),
		meta: {
			index: 0,
			title: '权限详情'
		}
	},


	// 友情链接路由
	// {
	// 	path: '/link/table',
	// 	name: 'link_table',
	// 	component: () => import('../views/link/table.vue'),
	// 	meta: {
	// 		index: 0,
	// 		title: '链接列表'
	// 	}
	// },
	// {
	// 	path: '/link/view',
	// 	name: 'link_view',
	// 	component: () => import('../views/link/view.vue'),
	// 	meta: {
	// 		index: 0,
	// 		title: '链接详情'
	// 	}
	// },

	// 轮播图路由
	{
		path: '/slides/table',
		name: 'slides_table',
		component: () => import('../views/slides/table.vue'),
		meta: {
			index: 0,
			title: '轮播图列表'
		}
	},
	{
		path: '/slides/view',
		name: 'slides_view',
		component: () => import('../views/slides/view.vue'),
		meta: {
			index: 0,
			title: '轮播图详情'
		}
	},
		// 文章路由
	{
		path: '/article/table',
		name: 'article_table',
		component: () => import('../views/article/table.vue'),
		meta: {
			index: 0,
			title: '文章列表'
		}
	},
	{
		path: '/article/view',
		name: 'article_view',
		component: () => import('../views/article/view.vue'),
		meta: {
			index: 0,
			title: '文章详情'
		}
	},

	// 文章分类路由
	{
		path: '/article_type/table',
		name: 'article_type_table',
		component: () => import('../views/article_type/table.vue'),
		meta: {
			index: 0,
			title: '文章分类列表'
		}
	},
	{
		path: '/article_type/view',
		name: 'article_type_view',
		component: () => import('../views/article_type/view.vue'),
		meta: {
			index: 0,
			title: '文章分类详情'
		}
	},
	
	// 广告路由
	// {
	// 	path: '/ad/table',
	// 	name: 'ad_table',
	// 	component: () => import('../views/ad/table.vue'),
	// 	meta: {
	// 		index: 0,
	// 		title: '广告列表'
	// 	}
	// },
	// {
	// 	path: '/ad/view',
	// 	name: 'ad_view',
	// 	component: () => import('../views/ad/view.vue'),
	// 	meta: {
	// 		index: 0,
	// 		title: '广告详情'
	// 	}
	// },



	// 公告路由
	{
		path: '/notice/table',
		name: 'notice_table',
		component: () => import('../views/notice/table.vue'),
		meta: {
			index: 0,
			title: '网站公告列表'
		}
	},
	{
		path: '/notice/view',
		name: 'notice_view',
		component: () => import('../views/notice/view.vue'),
		meta: {
			index: 0,
			title: '网站公告详情'
		}
	},


	// 评论路由
	{
		path: '/comment/table',
		name: 'comment_table',
		component: () => import('../views/comment/table.vue'),
		meta: {
			index: 0,
			title: '评论列表'
		}
	},
	{
		path: '/comment/view',
		name: 'comment_view',
		component: () => import('../views/comment/view.vue'),
		meta: {
			index: 0,
			title: '评论详情'
		}
	},

	// 会员用户路由
	{
		path: '/member_users/table',
		name: 'member_users_table',
		component: () => import('../views/member_users/table.vue'),
		meta: {
			index: 0,
			title: '会员用户列表'
		}
	},
	{
		path: '/member_users/view',
		name: 'member_users_view',
		component: () => import('../views/member_users/view.vue'),
		meta: {
			index: 0,
			title: '会员用户详情'
		}
	},
	// 医生用户路由
	{
		path: '/doctor_user/table',
		name: 'doctor_user_table',
		component: () => import('../views/doctor_user/table.vue'),
		meta: {
			index: 0,
			title: '医生用户列表'
		}
	},
	{
		path: '/doctor_user/view',
		name: 'doctor_user_view',
		component: () => import('../views/doctor_user/view.vue'),
		meta: {
			index: 0,
			title: '医生用户详情'
		}
	},
	// 会员信息路由
	{
		path: '/member_information/table',
		name: 'member_information_table',
		component: () => import('../views/member_information/table.vue'),
		meta: {
			index: 0,
			title: '会员信息列表'
		}
	},
	{
		path: '/member_information/view',
		name: 'member_information_view',
		component: () => import('../views/member_information/view.vue'),
		meta: {
			index: 0,
			title: '会员信息详情'
		}
	},
	// 医生信息路由
	{
		path: '/doctor_information/table',
		name: 'doctor_information_table',
		component: () => import('../views/doctor_information/table.vue'),
		meta: {
			index: 0,
			title: '医生信息列表'
		}
	},
	{
		path: '/doctor_information/view',
		name: 'doctor_information_view',
		component: () => import('../views/doctor_information/view.vue'),
		meta: {
			index: 0,
			title: '医生信息详情'
		}
	},
	// 体检预约路由
	{
		path: '/physical_examination_appointment/table',
		name: 'physical_examination_appointment_table',
		component: () => import('../views/physical_examination_appointment/table.vue'),
		meta: {
			index: 0,
			title: '体检预约列表'
		}
	},
	{
		path: '/physical_examination_appointment/view',
		name: 'physical_examination_appointment_view',
		component: () => import('../views/physical_examination_appointment/view.vue'),
		meta: {
			index: 0,
			title: '体检预约详情'
		}
	},
	// 咨询信息路由
	{
		path: '/consultation_information/table',
		name: 'consultation_information_table',
		component: () => import('../views/consultation_information/table.vue'),
		meta: {
			index: 0,
			title: '咨询信息列表'
		}
	},
	{
		path: '/consultation_information/view',
		name: 'consultation_information_view',
		component: () => import('../views/consultation_information/view.vue'),
		meta: {
			index: 0,
			title: '咨询信息详情'
		}
	},
	// 咨询回复路由
	{
		path: '/consultation_response/table',
		name: 'consultation_response_table',
		component: () => import('../views/consultation_response/table.vue'),
		meta: {
			index: 0,
			title: '咨询回复列表'
		}
	},
	{
		path: '/consultation_response/view',
		name: 'consultation_response_view',
		component: () => import('../views/consultation_response/view.vue'),
		meta: {
			index: 0,
			title: '咨询回复详情'
		}
	},
	// 健康档案路由
	{
		path: '/health_records/table',
		name: 'health_records_table',
		component: () => import('../views/health_records/table.vue'),
		meta: {
			index: 0,
			title: '健康档案列表'
		}
	},
	{
		path: '/health_records/view',
		name: 'health_records_view',
		component: () => import('../views/health_records/view.vue'),
		meta: {
			index: 0,
			title: '健康档案详情'
		}
	},
	// 健康评估路由
	{
		path: '/health_assessment/table',
		name: 'health_assessment_table',
		component: () => import('../views/health_assessment/table.vue'),
		meta: {
			index: 0,
			title: '健康评估列表'
		}
	},
	{
		path: '/health_assessment/view',
		name: 'health_assessment_view',
		component: () => import('../views/health_assessment/view.vue'),
		meta: {
			index: 0,
			title: '健康评估详情'
		}
	},
	// 意见反馈路由
	{
		path: '/feedback/table',
		name: 'feedback_table',
		component: () => import('../views/feedback/table.vue'),
		meta: {
			index: 0,
			title: '意见反馈列表'
		}
	},
	{
		path: '/feedback/view',
		name: 'feedback_view',
		component: () => import('../views/feedback/view.vue'),
		meta: {
			index: 0,
			title: '意见反馈详情'
		}
	},

	// 用户路由
	{
		path: '/user/table',
		name: 'user_table',
		component: () => import('../views/user/table.vue'),
		meta: {
			index: 0,
			title: '用户列表'
		}
	},
	{
		path: '/user/view',
		name: 'user_view',
		component: () => import('../views/user/view.vue'),
		meta: {
			index: 0,
			title: '用户详情'
		}
	},
	{
		path: '/user/info',
		name: 'user_info',
		component: () => import('../views/user/info.vue'),
		meta: {
			index: 0,
			title: '个人信息'
		}
	},
	// 用户组路由
	{
		path: '/user_group/table',
		name: 'user_group_table',
		component: () => import('../views/user_group/table.vue'),
		meta: {
			index: 0,
			title: '用户组列表'
		}
	},
	{
		path: '/user_group/view',
		name: 'user_group_view',
		component: () => import('../views/user_group/view.vue'),
		meta: {
			index: 0,
			title: '用户组详情'
		}
	}
]

const router = new VueRouter({
	mode: 'history',
	base: process.env.BASE_URL,
	routes
})

router.beforeEach((to, from, next) => {
	let token = to.query.token;
	if (token){
		$.db.set("token",token,120);
	}
	next();
})

router.afterEach((to, from, next) => {
	let title = "健康管理系统小程序 -admin";
	document.title = title;
})

export default router
