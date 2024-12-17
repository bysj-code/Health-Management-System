<template>
	<view class="diy_details diy_div_member_information">
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
					<view v-if="$check_field('get','last_physical_examination')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>上次体检:</span>
						</view>
							<view class="diy_field diy_date">
							<text>
								{{ $toTime(obj["last_physical_examination"],"yyyy-MM-dd") }}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','identification_number')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>证件号码:</span>
						</view>
							<view class="diy_field diy_text">
							<text>
								{{obj["identification_number"]}}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','contact_information')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>联系方式:</span>
						</view>
							<view class="diy_field diy_text">
							<text>
								{{obj["contact_information"]}}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','residential_address')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>居住地址:</span>
						</view>
							<view class="diy_field diy_desc">
							<text>
								{{ obj["residential_address"] }}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','member_notes')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>会员备注:</span>
						</view>
							<view class="diy_field diy_desc">
							<text>
								{{ obj["member_notes"] }}
							</text>
						</view>
						</view>
				</view>
			</view>
		</view>

			<view class="warp">
			<view class="container">
				<view class="row">
					<view class="col">
						<button type="button" class="diy_btn" @click="to_form('/pages/health_records/edit')" v-if="$check_action('/health_records/edit','add') || $check_action('/health_records/edit','set')" >添加档案</button>
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
						member_information_id: 0
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
				var res = await this.$get("~/api/member_information/get_obj", {
					member_information_id:this.query.member_information_id
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
										},
		created() {
				this.get_list_user_member_account();
										},
		async onLoad(){
			if (Object.keys(this.obj_goods).length !== 0) {
				await this.get_obj_goods_type();
				await this.get_obj_by_goods();
			} else if (this.query["member_information_id"] !==0) {
				await this.get_obj_by_id();
			}
		}
	}
</script>

<style scoped>
	.div_member_information_details {}

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
