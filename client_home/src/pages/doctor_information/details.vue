<template>
	<view class="page_doctor_information diy_detail diy_detail--new" id="doctor_information_details">
		<view class="warp">
			<view class="container-fluid">
				<view class="row">
					<view v-if="$check_field('get','doctor_account')" class="col-12 col-6">
						<view class="view">
							<view class="diy_title">
								<span>医生账号</span>
							</view>
								<view class="diy_field diy_uid">
								{{ get_user_doctor_account(obj['doctor_account']) }}
							</view>
							</view>
					</view>
					<view v-if="$check_field('get','doctor_no')" class="col-12 col-6">
						<view class="view">
							<view class="diy_title">
								<span>医生编号</span>
							</view>
								<view class="diy_field diy_text">
								<span>
									{{ obj["doctor_no"] }}
								</span>
							</view>
							</view>
					</view>
					<view v-if="$check_field('get','doctors_name')" class="col-12 col-6">
						<view class="view">
							<view class="diy_title">
								<span>医生姓名</span>
							</view>
								<view class="diy_field diy_text">
								<span>
									{{ obj["doctors_name"] }}
								</span>
							</view>
							</view>
					</view>
					<view v-if="$check_field('get','doctors_photo')" class="col-12 col-6">
						<view class="view">
							<view class="diy_title">
								<span>医生照片</span>
							</view>
								<view class="diy_field diy_img">
								<img :src="$fullUrl(obj['doctors_photo'])" />
							</view>
							</view>
					</view>
					<view v-if="$check_field('get','doctors_gender')" class="col-12 col-6">
						<view class="view">
							<view class="diy_title">
								<span>医生性别</span>
							</view>
								<view class="diy_field diy_text">
								<span>
									{{ obj["doctors_gender"] }}
								</span>
							</view>
							</view>
					</view>
					<view v-if="$check_field('get','employment_time')" class="col-12 col-6">
						<view class="view">
							<view class="diy_title">
								<span>从业时间</span>
							</view>
								<view class="diy_field diy_text">
								<span>
									{{ obj["employment_time"] }}
								</span>
							</view>
							</view>
					</view>
					<view v-if="$check_field('get','doctor_introduction')" class="col-12 col-6">
						<view class="view">
							<view class="diy_title">
								<span>医生简介</span>
							</view>
								<view class="diy_field diy_desc">
								<span>
									{{ obj["doctor_introduction"] }}
								</span>
							</view>
							</view>
					</view>
				</view>
			</view>
			<view class="row">
					<view class="col-12 col-md-4 view">
					<span>点赞{{ obj["praise_len"] }}</span>
				</view>
	
	
					<view class="col-12 col-md-4 view">
					<span>点击数{{ obj["hits"] }}</span>
				</view>
				</view>
		</view>




		<view class="warp">
			<view class="container-fluid container-fluid-comment--new">
				<view class="row">
					<view class="col">
									<button type="button" class="btn btn-primary" v-if="$check_action('/physical_examination_appointment/edit','add')" @click="to_form('/pages/physical_examination_appointment/edit')">
							<span>预约体检</span>
						</button>
								<button type="button" class="btn btn-primary" v-if="$check_action('/consultation_information/edit','add')" @click="to_form('/pages/consultation_information/edit')">
							<span>线上咨询</span>
						</button>
			
<!--						<button type="button" class="btn btn-primary" @click="cancel()">返回</button>-->

						<button type="button" class="btn btn-primary" @click="change_praise()">
							<span>点赞</span>
						</button>



						<navigator @click="change_collect()" class="btn publish_box">
							<uni-icons type="heart"></uni-icons>
							<text>收藏</text>
						</navigator>

					</view>
				</view>
			</view>
		</view>


	</view>
</template>

<script>
	import list_comment from "@/components/diy/list_comment.vue";
	import bar_title from "@/components/diy/bar_title.vue";
	import form_editor from "@/components/diy/form_editor.vue";

	import mixin from "@/libs/mixins/page.js";
	export default {
		mixins: [mixin],
		components: {
			list_comment,
			bar_title,
			form_editor
		},
		data() {
			return {
				url_get_obj: "~/api/doctor_information/get_obj?",
				field: "doctor_information_id",
				query: {
					"doctor_information_id": 0
				},
				// 商品详情初始化
				obj: {
						"doctor_account": 0,
							"doctor_no": "",
							"doctors_name": "",
							"doctors_photo": "",
							"doctors_gender": "",
							"employment_time": "",
							"doctor_introduction": "",
						"hits": 0,
					"praise_len": 0,
					"doctor_information_id": 0,

				},
				// 点赞
				praise: 0,
				// 点赞状态
				state_praise: false,
				// 收藏
				collect: 0,
				// 收藏状态
				state_collect: false,
				// 评论列表初始化
				list_comment: [],
				// 评论bar标题
				bar_title: "评论区",
				// 评论bar的链接
				bar_url: "",
					// 用户列表
				list_user_doctor_account: [],
										}
		},
		methods: {
			openUrl(url) {
				console.log(1111)
				uni.navigateTo({
					url:`/pages/webview/webview?url=${url}`
				})
			},
			/**
			 * 获取点赞
			 * @param {Object} obj
			 */
			get_praise(obj) {
				var user_id = this.user.user_id;

				this.$get("~/api/praise/count?", {
					source_table: "doctor_information",
					source_field: "doctor_information_id",
					source_id: obj["doctor_information_id"]
				}, (res) => {
					if (res.result || res.result === 0) {
						this.praise = res.result;
						console.log("点赞数：" ,res.result);
					}
					else if (res.error){
						this.$toast(res.error.message);
						console.error(res.error);
					}
				});

				this.$get("~/api/praise/count?", {
					source_table: "doctor_information",
					source_field: "doctor_information_id",
					source_id: obj["doctor_information_id"],
					user_id
				}, (res) => {
					if (res.result || res.result === 0) {
						this.state_praise = res.result ? true : false;
						console.log("点赞状态：" ,res.result);
					}
					else if (res.error){
						this.$toast(res.error.message);
						console.error(res.error);
					}
				})
			},

			/**
			 * 改变点赞数
			 */
			change_praise(obj) {
				var user_id = this.user.user_id;

				var query = {
					source_table: "doctor_information",
					source_field: "doctor_information_id",
					source_id: this.obj["doctor_information_id"],
					user_id
				};

				var _this = this;
        _this.obj.praise_len = parseInt(_this.obj.praise_len)
				// 点赞状态
				if (this.state_praise) {
					this.state_praise = false;
					this.$get('~/api/praise/del?', query, (res) => {
						if(res.result){
							var praise_len = _this.obj.praise_len-1
							this.$post('~/api/doctor_information/set?doctor_information_id=' + _this.obj["doctor_information_id"], {
								praise_len
							}, (res) => {
								if(res.result){
									console.log("添加点赞数状态：" ,res.result);
								}
								else if(res.error){
									console.error(res.error);
								}
							});
							this.$toast("取消点赞");
						}
						else if (res.error){
							this.$toast(res.error.message);
							console.error(res.error);
						}
					});
				} else {
					this.state_praise = true;
					this.$post('~/api/praise/add?', query, (res) => {
						if (res.result) {
							var praise_len = _this.obj.praise_len+1
							this.$post('~/api/doctor_information/set?doctor_information_id=' + _this.obj["doctor_information_id"], {
								praise_len
							}, (res) => {
								if(res.result){
									console.log("添加点赞数状态：" ,res.result);
								}
								else if(res.error){
									console.error(res.error);
								}
							});
							this.$toast("点赞成功");
						}
						else if (res.error) {
							this.$toast(res.error.message);
							console.error(res.error);
						}
					});
				};
			},

			/**
			 * 初始化收藏状态
			 * @param {Object} obj
			 */
			get_collect(obj) {
				var user_id = this.user.user_id;

				var query = {
					source_table: "doctor_information",
					source_field: "doctor_information_id",
					source_id: obj["doctor_information_id"],
					user_id
				};

				this.$get('~/api/collect/count?', query, (res) => {
					console.log(res);
					if (res.result || res.result === 0) {
						var bl = res.result ? true : false;
						this.state_collect = bl;
						console.log("收藏状态：" + bl);
					}
					else if(res.error) {
						console.error(res.error);
					}
				});
			},

			/**
			 * 改变收藏状态
			 */
			change_collect() {
				var user_id = this.user.user_id;

				var query = {
					source_table: "doctor_information",
					source_field: "doctor_information_id",
					source_id: this.obj["doctor_information_id"],
					user_id
				};

				// 收藏状态
				if (this.state_collect) {
					this.state_collect = false;
					this.$get('~/api/collect/del?', query, (res) => {
						if(res.result){
							this.$toast("取消收藏");
						}
						else if (res.error){
							this.$toast(res.error.message);
							console.error(res.error);
						}
					});
				} else {
					this.state_collect = true;
																		query.title = this.obj.doctors_name
														query.img = this.obj.doctors_photo
																							this.$post('~/api/collect/add?', query, (res) => {
						if (res.result) {
							this.$toast("收藏成功");
						}
						else if (res.error) {
							this.$toast(res.error.message);
							console.error(res.error);
						}
					});
				};
			},


			/**
			 * 添加访问量
			 */
			add_hits(obj) {
				obj["hits"] = obj["hits"] + 1;
				var hits = obj["hits"];
				this.$post('~/api/doctor_information/set?doctor_information_id=' + obj["doctor_information_id"], {
					hits
				}, (res) => {
					if(res.result){
						console.log("添加访问量状态：" ,res.result);
						var body = {
							source_table: "doctor_information",
							source_field: "doctor_information_id",
							source_id: this.obj.doctor_information_id,
							user_id: this.$store.state.user.user_id,
						};
						this.$post("~/api/hits/add?", body, (res) => {
							console.log(res);
						});
					}
					else if(res.error){
						console.error(res.error);
					}
				});
			},

			/**
			 * 获取对象之后
			 * @param {Object} json 结果对象
			 */
			get_obj_after(json) {
				// 判断是否获取到数据
				if (this.obj) {
					var obj = this.obj;
					// 获取点赞数
					this.get_praise(obj);
					// 初始化收藏状态
					this.get_collect(obj);
					// 增加点击数
					this.add_hits(obj);
				}
			},

				/**
			 * 获取医生用户用户列表
			 */
			async get_list_user_doctor_account() {
				var json = await this.$get("~/api/user/get_list?user_group=医生用户");
				if(json.result && json.result.list){
					this.list_user_doctor_account = json.result.list;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
			get_user_doctor_account(id){
				let obj = this.list_user_doctor_account;
				let ret = "";
				for(let i=0;i<obj.length;i++){
					if(obj[i].user_id==id){
						ret = obj[i].nickname+"-"+obj[i].username;
					}
				}
				return ret;
			},
									},
		created() {
				this.get_list_user_doctor_account();
									},
		mounted() {
		},
	}

</script>

<style>
	.page_goods {
		padding-bottom: 3rem;
	}

	.link {
		text-align: center;
		padding: 0.5rem 0;
		border: 1px solid #DBDBDB;
		border-radius: 0.5rem;
	}

	.buy_wrap {
		position: fixed;
		bottom: 0;
		left: 0;
		width: 100%;
	}

	.dialog {
		width: 100%;
		height: 100vh;
		background: rgba(0, 0, 0, 0.5);
		z-index: 999;
		position: fixed;
		left: 0;
		top: 0;
		padding: 20vh 0;
	}

	.dialog-content {
		width: 500upx;
		height: 60vh;
		margin: 0 auto;
		background: #FFF;
		border-radius: 10upx;
		overflow: hidden;
		position: relative;
		display: flex;
		flex-direction: column;
		padding:  5vh;
		text-align: center;

	}
	.dialog-content span{
		margin-top:  3vh;
		}

	.dialog-close {
		width: 40upx;
		height: 40upx;
		border-radius: 20upx;
		position: absolute;
		right: 10upx;
		top: 10upx;
		font-size: 26upx;
		line-height: 40upx;
		text-align: center;
	}

	.dialog-list {
		padding: 40upx 20upx;
	}

	scroll-view {
		width: 100%;
		height: 100%;
	}

	.show-dialog {
		animation: 100ms showDialog linear forwards;
	}

	.hide-dialog {
		animation: 100ms hideDialog linear forwards;
	}

	@keyframes hideDialog {
		0% {
			opacity: 1;
		}


		100% {
			opacity: 0;
		}
	}

	@keyframes showDialog {
		0% {
			opacity: 0;
		}


		100% {
			opacity: 1;
		}
	}

	/* new style start */
	.diy_detail--new{
		padding: 5px;
	}
	.diy_detail--new .view {
		border-bottom: 1px solid #ccc;
		padding: 8px 0 ;
	}
	.diy_detail--new .view uni-view{
		display: inline-block;
	}
	.diy_detail--new .view .diy_title{
		color: var(--color_primary);
		margin-right: 5px;
		vertical-align: top;
	}
	.diy_detail--new .view .diy_img img{
		width: 100%;
	}
	.diy_detail--new .view .diy_music{
		vertical-align: text-top;
	}
	.diy_detail--new .bar_title{
		position: relative;
		background-color: #fff;
		display: flex;
		justify-content: space-between;
		align-items: center;
		margin-bottom: 2px;
		background: var(--color_primary);
		border-radius: 10px;
		height: 46px;
	}
	.diy_detail--new .bar_title .title{
		margin: 0 auto;
		color: var(--color_white);
		font-weight: 600;
	}
	.diy_detail--new .container-fluid-comment--new{
		margin: 10px 0.6rem;
	}
	.diy_detail--new .container-fluid-comment--new .col{
		display: flex;
		flex: auto;
		flex-wrap: wrap;
		flex-direction: row;
		margin-left: -10px;
	}
	.diy_detail--new .container-fluid-comment--new .btn{
		display: inline-block;
		border: none;
		background: var(--color_primary);
		color: #fff;
		font-size: 16px !important;
		padding: 2px 12px !important;
		border-radius: 20px;
		line-height: inherit;
		margin-bottom: 5px;
		margin-left: 10px;
		margin-right: 0;
	}
	.diy_detail--new .container-fluid-comment--new .btn:after{
		display: none;
	}
	.diy_detail--new .container-fluid-comment--new .btn .uni-icons{
		color: #fff !important;
	}
	.diy_detail--new .comment_title{
		margin-top: 10px;
	}
	/* new style end */

</style>
