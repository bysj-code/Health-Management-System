<template>
	<view class="diy_details diy_div_consultation_response">
		<view v-if="Object.keys(obj).length!==0" class="warp">
			<view class="container">
				<view class="row">
					<view v-if="$check_field('get','member_account')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>会员账号:</span>
						</view>
							<view class="diy_field diy_uid">
							<text>
								{{ get_user_member_account(obj['member_account']) }}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','member_name')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>会员姓名:</span>
						</view>
							<view class="diy_field diy_text">
							<text>
								{{obj["member_name"]}}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','member_gender')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>会员性别:</span>
						</view>
							<view class="diy_field diy_text">
							<text>
								{{obj["member_gender"]}}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','doctor_account')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>医生账号:</span>
						</view>
							<view class="diy_field diy_uid">
							<text>
								{{ get_user_doctor_account(obj['doctor_account']) }}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','doctor_no')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>医生编号:</span>
						</view>
							<view class="diy_field diy_text">
							<text>
								{{obj["doctor_no"]}}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','doctors_name')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>医生姓名:</span>
						</view>
							<view class="diy_field diy_text">
							<text>
								{{obj["doctors_name"]}}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','consultation_topic')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>咨询主题:</span>
						</view>
							<view class="diy_field diy_text">
							<text>
								{{obj["consultation_topic"]}}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','content')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>内容:</span>
						</view>
							<view class="diy_field diy_desc">
							<text>
								{{ obj["content"] }}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','reply_time')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>回复时间:</span>
						</view>
							<view class="diy_field diy_datetime">
							<text>
								{{ $toTime(obj["reply_time"],"yyyy-MM-dd hh:mm:ss") }}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','reply')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>回复:</span>
						</view>
							<view class="diy_field diy_desc">
							<text>
								{{ obj["reply"] }}
							</text>
						</view>
						</view>
				</view>
			</view>
		</view>

	</view>
</template>

<script>
	import mixin from "@/libs/mixins/component.js";
	export default {
		mixins: [mixin],
		props: {
			obj_goods: {
				type: Object,
				default(){
					return {}
				}
			},
			query:{
				type: Object,
				default(){
					return {
						consultation_response_id: 0
					}
				}
			}
		},
		data() {
			return {
				obj_goods_type: {},
				obj: {},
					// 用户列表
				list_user_member_account: [],
								// 用户列表
				list_user_doctor_account: [],
										}
		},
		methods: {
			async get_obj_goods_type() {
				var res = await this.$get("~/api/goods_type/get_obj", {
					name: this.obj_goods.type
				})

				if (res.result.obj) {
					this.obj_goods_type = res.result.obj
				} else {
					console.log("没有请求到商品分类");
				}
			},
			async get_obj_by_goods() {
				var {
					source_table,
					source_field
				} = this.obj_goods_type
				var {
					source_id
				} = this.obj_goods
				var query = {}
				query[source_field] = source_id
				this.$get("~/api/" + source_table + "/get_obj", {}, (res) => {
					if (res.result.obj) {
						this.obj = res.result.obj
					} else {
						console.log("没有请求到商品分类");
					}
				})
			},
			async get_obj_by_id(){
				var res = await this.$get("~/api/consultation_response/get_obj", {
					consultation_response_id:this.query.consultation_response_id
				})

				if (res.result && res.result.obj) {
					this.obj = res.result.obj
				} else {
					console.log("没有请求到商品分类");
				}
			},
				/**
			 * 获取会员用户用户列表
			 */
			async get_list_user_member_account() {
				var json = await this.$get("~/api/user/get_list?user_group=会员用户");
				if(json.result && json.result.list){
					this.list_user_member_account = json.result.list;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
			get_user_member_account(id){
				let obj = this.list_user_member_account;
				let ret = "";
				for(let i=0;i<obj.length;i++){
					if(obj[i].user_id==id){
						ret = obj[i].nickname+"-"+obj[i].username;
					}
				}
				return ret;
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
				this.get_list_user_member_account();
							this.get_list_user_doctor_account();
									},
		async onLoad(){
			if (Object.keys(this.obj_goods).length !== 0) {
				await this.get_obj_goods_type();
				await this.get_obj_by_goods();
			} else if (this.query["consultation_response_id"] !==0) {
				await this.get_obj_by_id();
			}
		}
	}
</script>

<style scoped>
	.div_consultation_response_details {}

	.details {
		background-color: #fff;
		margin-bottom: 0.5rem;
		padding: 1rem;
		font-size: 10px;
	}

	.item {
		display: flex;
		padding: 0.2rem 0;
		border-bottom: 1px solid #eee;
	}

	.left_text {
		flex: 0 0 25%;
	}

	.right_text {
		flex: 0 0 75%;
	}
	.edit_nav{
		text-align: center;
		background-color: #fff;
		padding: 0.3rem;
		margin: 0.1rem 1rem;
		border: 1px solid #eee;
		border-radius: 0.5rem;
	}
</style>
