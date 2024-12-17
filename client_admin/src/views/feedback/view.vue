<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','member_account') || $check_field('add','member_account') || $check_field('set','member_account')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="会员账号" prop="member_account">
																		<div v-if="user_group !== '管理员'">
							{{ get_user_session_member_account(form['member_account']) }}
							<!--<el-input id="business_name" v-model="form['member_account']" placeholder="请输入会员账号"-->
							<!--v-if="user_group === '管理员' || (form['feedback_id'] && $check_field('set','member_account')) || (!form['feedback_id'] && $check_field('add','member_account'))" :disabled="disabledObj['member_account_isDisabled']"></el-input>-->
							<!--<div v-else-if="$check_field('get','member_account')">{{form['member_account']}}</div>-->
							<el-select v-if="user_group === '管理员' || (form['feedback_id'] && $check_field('set','member_account')) || (!form['feedback_id'] && $check_field('add','member_account'))" id="member_account" v-model="form['member_account']" :disabled="disabledObj['member_account_isDisabled']">
								<el-option v-for="o in list_user_member_account" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
							<el-select v-else-if="$check_field('get','member_account')" id="member_account" v-model="form['member_account']" :disabled="true">
								<el-option v-for="o in list_user_member_account" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
						</div>
						<el-select v-else id="member_account" v-model="form['member_account']" :disabled="disabledObj['member_account_isDisabled']">
							<el-option v-for="o in list_user_member_account" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
																</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','member_name') || $check_field('add','member_name') || $check_field('set','member_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="会员姓名" prop="member_name">
												<el-input id="member_name" v-model="form['member_name']" placeholder="请输入会员姓名"
							  v-if="user_group === '管理员' || (form['feedback_id'] && $check_field('set','member_name')) || (!form['feedback_id'] && $check_field('add','member_name'))" :disabled="disabledObj['member_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','member_name')">{{form['member_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','submission_time') || $check_field('add','submission_time') || $check_field('set','submission_time')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="提交时间" prop="submission_time">
								<el-date-picker :disabled="disabledObj['submission_time_isDisabled']" v-if="user_group === '管理员' || (form['feedback_id'] && $check_field('set','submission_time')) || (!form['feedback_id'] && $check_field('add','submission_time'))" id="submission_time"
						v-model="form['submission_time']" type="datetime" placeholder="选择日期时间">
					</el-date-picker>
					<div v-else-if="$check_field('get','submission_time')">{{form['submission_time']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','feedback_type') || $check_field('add','feedback_type') || $check_field('set','feedback_type')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="反馈类型" prop="feedback_type">
								<el-select id="feedback_type" v-model="form['feedback_type']"
						v-if="user_group === '管理员' || (form['feedback_id'] && $check_field('set','feedback_type')) || (!form['feedback_id'] && $check_field('add','feedback_type'))">
						<el-option v-for="o in list_feedback_type" :key="o" :label="o" :value="o">
						</el-option>
					</el-select>
					<div v-else-if="$check_field('get','feedback_type')">{{form['feedback_type']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','feedback_content') || $check_field('add','feedback_content') || $check_field('set','feedback_content')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="内容" prop="feedback_content">
								<el-input type="textarea" id="feedback_content" v-model="form['feedback_content']" placeholder="请输入内容"
						v-if="user_group === '管理员' || (form['feedback_id'] && $check_field('set','feedback_content')) || (!form['feedback_id'] && $check_field('add','feedback_content'))" :disabled="disabledObj['feedback_content_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','feedback_content')">{{form['feedback_content']}}</div>
							</el-form-item>
			</el-col>
							<el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="审核状态" prop="examine_state">
					<el-select id="examine_state" v-model="form['examine_state']"
						v-if="user_group === '管理员' || (form['examine_state'] && $check_examine()) || (!form['examine_state'] && $check_examine())">
						<el-option key="未审核" label="未审核" value="未审核"></el-option>
						<el-option key="已通过" label="已通过" value="已通过"></el-option>
						<el-option key="未通过" label="未通过" value="未通过"></el-option>
					</el-select>
					<div v-else>{{form["examine_state"]}}</div>
				</el-form-item>
			</el-col>
					<el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="审核回复" prop="examine_reply">
					<el-input id="examine_reply" v-model="form['examine_reply']" placeholder="请输入审核回复"
						v-if="user_group === '管理员' || (form['examine_reply'] && $check_examine()) || (!form['examine_reply'] && $check_examine())"></el-input>
					<div v-else>{{form["examine_reply"]}}</div>
				</el-form-item>
			</el-col>
	
	
	
	
	
	
	
			<el-col :xs="24" :sm="12" :lg="8" class="el_form_btn_warp">
				<el-form-item>
					<el-button type="primary" @click="submit()">提交</el-button>
					<el-button @click="cancel()">取消</el-button>
				</el-form-item>
			</el-col>

		</el-form>
	</el-main>
</template>

<script>
	import mixin from "@/mixins/page.js";

	export default {
		mixins: [mixin],
		data() {
			return {
				field: "feedback_id",
				url_add: "~/api/feedback/add?",
				url_set: "~/api/feedback/set?",
				url_get_obj: "~/api/feedback/get_obj?",
				url_upload: "~/api/feedback/upload?",

				query: {
					"feedback_id": 0,
				},

				form: {
								"member_account": 0, // 会员账号
										"member_name":  '', // 会员姓名
										"submission_time":  '', // 提交时间
										"feedback_type":  '', // 反馈类型
										"feedback_content":  '', // 内容
									"examine_state": "未审核",
							"examine_reply": "",
							"feedback_id": 0, // ID
						
				},
				disabledObj:{
								"member_account_isDisabled": false,
										"member_name_isDisabled": false,
										"submission_time_isDisabled": false,
										"feedback_type_isDisabled": false,
										"feedback_content_isDisabled": false,
										},

	
					// 用户列表
				list_user_member_account: [],
						// 用户组
				group_user_member_account: "",
				
		
						// 反馈类型选项列表
				list_feedback_type: ['建议','投诉'],
	
		
	
			}
		},
		methods: {


	
	
				/**
			 * 获取会员用户用户列表
			 */
			async get_list_user_member_account() {
                // if(this.user_group !== "管理员" && this.form["member_account"] === 0) {
                //     this.form["member_account"] = this.user.user_id;
                // }
                var json = await this.$get("~/api/user/get_list?user_group=会员用户");
                if(json.result && json.result.list){
                    this.list_user_member_account = json.result.list;
                }
                else if(json.error){
                    console.error(json.error);
                }
			},
					/**
			 * 获取会员用户用户组
			 */
			async get_group_user_member_account() {
							this.form["member_account"] = this.user.user_id;
							var json = await this.$get("~/api/user_group/get_obj?name=会员用户");
				if(json.result && json.result.obj){
					this.group_user_member_account = json.result.obj;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
			get_user_session_member_account(id){
				var _this = this;
				var user_id = {"user_id":id}
				var url = "~/api/"+_this.group_user_member_account.source_table+"/get_obj?"
				this.$get(url, user_id, function(res) {
					if (res.result && res.result.obj) {
						var arr = []
						for (let key in res.result.obj) {
							arr.push(key)
						}
						var arrForm = []
									for (let key in _this.form) {
							arrForm.push(key)
						}
												_this.form["member_account"] = id
									_this.disabledObj['member_account' + '_isDisabled'] = true
						for (var i=0;i<arr.length;i++){
						  if (arr[i]!=='examine_state' && arr[i]!=='examine_reply') {
							for (var j = 0; j < arrForm.length; j++) {
							  if (arr[i] === arrForm[j]) {
								if (arr[i] !== "member_account") {
			                      _this.form[arrForm[j]] = res.result.obj[arr[i]]
			                      _this.disabledObj[arrForm[j] + '_isDisabled'] = true
								  break;
								} else {
								  _this.disabledObj[arrForm[j] + '_isDisabled'] = true
								}
							  }
							}
						  }
						}
					}
				});
			},
					get_user_member_account(id){
				var obj = this.list_user_member_account.getObj({"user_id":id});
				var ret = "";
				if(obj){
					if(obj.nickname){
						ret = obj.nickname;}
					else{
						ret = obj.username;
					}
				}
				return ret;
			},
			
	
			
	
			
	
			
	
		
			/**
			 * 获取对象之前
			 * @param {Object} param
			 */
			get_obj_before(param) {
				var form = "";
																												
				if(this.form && form){
					Object.keys(this.form).forEach(key => {
						Object.keys(form).forEach(dbKey => {
							// if(dbKey === "charging_standard"){
							// 	this.form['charging_rules'] = form[dbKey];
							// 	this.disabledObj['charging_rules_isDisabled'] = true;
							// };
							if(key === dbKey){
								this.disabledObj[key+'_isDisabled'] = true;
							}
						})
					})
				}
					        if (this.form["submission_time"].indexOf("-")===-1){
            this.form["submission_time"] = this.$toTime(parseInt(this.form["submission_time"]),"yyyy-MM-dd hh:mm:ss")
        }
										$.db.del("form");
				return param;
			},

			/**
			 * 获取对象之后
			 * @param {Object} json
			 * @param {Object} func
			 */
			get_obj_after(json, func){


							        if(this.form["submission_time"]=="0000-00-00 00:00:00"){
          this.form["submission_time"] = null;
        }
				if(parseInt(this.form["submission_time"]) > 9999){
					this.form["submission_time"] = this.$toTime(parseInt(this.form["submission_time"]),"yyyy-MM-dd hh:mm:ss")
				}
									


			},

			/**
			 * 提交前验证事件
			 * @param {Object} 请求参数
			 * @return {String} 验证成功返回null, 失败返回错误提示
			 */
			submit_check(param) {
				let msg = null
																					return msg;
			},

			is_view(){
				var bl = this.user_group == "管理员";

				if(!bl){
					bl = this.$check_action('/feedback/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/feedback/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/feedback/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/feedback/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/feedback/view','get');
					console.log(bl ? "你有视图查询权限视作有查询权限" : "你没有视图查询权限");
				}

				console.log(bl ? "具有当前页面的查看权，请注意这不代表你有字段的查看权" : "无权查看当前页，请注意即便有字段查询权限没有页面查询权限也不行");

				return bl;
			},
			/**
			 * 上传文件
			 * @param {Object} param
			 */
			uploadimg(param) {
				this.uploadFile(param.file, "avatar");
			},

		},
		created() {
					this.get_list_user_member_account();
					this.get_group_user_member_account();
													},
	}
</script>

<style>
	.avatar-uploader .el-upload {
		border: 1px dashed #d9d9d9;
		border-radius: 6px;
		cursor: pointer;
		position: relative;
		overflow: hidden;
	}

	.avatar-uploader .el-upload:hover {
		border-color: #409EFF;
	}

	.avatar-uploader-icon {
		font-size: 28px;
		color: #8c939d;
		width: 178px;
		height: 178px;
		line-height: 178px;
		text-align: center;
	}

	.avatar {
		width: 178px;
		height: 178px;
		display: block;
	}




</style>
