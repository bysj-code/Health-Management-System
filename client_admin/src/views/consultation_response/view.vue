<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','member_account') || $check_field('add','member_account') || $check_field('set','member_account')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="会员账号" prop="member_account">
																		<div v-if="user_group !== '管理员'">
							{{ get_user_session_member_account(form['member_account']) }}
							<!--<el-input id="business_name" v-model="form['member_account']" placeholder="请输入会员账号"-->
							<!--v-if="user_group === '管理员' || (form['consultation_response_id'] && $check_field('set','member_account')) || (!form['consultation_response_id'] && $check_field('add','member_account'))" :disabled="disabledObj['member_account_isDisabled']"></el-input>-->
							<!--<div v-else-if="$check_field('get','member_account')">{{form['member_account']}}</div>-->
							<el-select v-if="user_group === '管理员' || (form['consultation_response_id'] && $check_field('set','member_account')) || (!form['consultation_response_id'] && $check_field('add','member_account'))" id="member_account" v-model="form['member_account']" :disabled="disabledObj['member_account_isDisabled']">
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
							  v-if="user_group === '管理员' || (form['consultation_response_id'] && $check_field('set','member_name')) || (!form['consultation_response_id'] && $check_field('add','member_name'))" :disabled="disabledObj['member_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','member_name')">{{form['member_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','member_gender') || $check_field('add','member_gender') || $check_field('set','member_gender')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="会员性别" prop="member_gender">
												<el-input id="member_gender" v-model="form['member_gender']" placeholder="请输入会员性别"
							  v-if="user_group === '管理员' || (form['consultation_response_id'] && $check_field('set','member_gender')) || (!form['consultation_response_id'] && $check_field('add','member_gender'))" :disabled="disabledObj['member_gender_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','member_gender')">{{form['member_gender']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','doctor_account') || $check_field('add','doctor_account') || $check_field('set','doctor_account')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="医生账号" prop="doctor_account">
													<el-select v-if="user_group === '管理员' || (form['consultation_response_id'] && $check_field('set','doctor_account')) || (!form['consultation_response_id'] && $check_field('add','doctor_account'))" id="doctor_account" v-model="form['doctor_account']" :disabled="disabledObj['doctor_account_isDisabled']">
							<el-option v-for="o in list_user_doctor_account" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
						<el-select v-else-if="$check_field('get','doctor_account')" id="doctor_account" v-model="form['doctor_account']" :disabled="true">
							<el-option v-for="o in list_user_doctor_account" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','doctor_no') || $check_field('add','doctor_no') || $check_field('set','doctor_no')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="医生编号" prop="doctor_no">
												<el-input id="doctor_no" v-model="form['doctor_no']" placeholder="请输入医生编号"
							  v-if="user_group === '管理员' || (form['consultation_response_id'] && $check_field('set','doctor_no')) || (!form['consultation_response_id'] && $check_field('add','doctor_no'))" :disabled="disabledObj['doctor_no_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','doctor_no')">{{form['doctor_no']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','doctors_name') || $check_field('add','doctors_name') || $check_field('set','doctors_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="医生姓名" prop="doctors_name">
												<el-input id="doctors_name" v-model="form['doctors_name']" placeholder="请输入医生姓名"
							  v-if="user_group === '管理员' || (form['consultation_response_id'] && $check_field('set','doctors_name')) || (!form['consultation_response_id'] && $check_field('add','doctors_name'))" :disabled="disabledObj['doctors_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','doctors_name')">{{form['doctors_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','consultation_topic') || $check_field('add','consultation_topic') || $check_field('set','consultation_topic')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="咨询主题" prop="consultation_topic">
												<el-input id="consultation_topic" v-model="form['consultation_topic']" placeholder="请输入咨询主题"
							  v-if="user_group === '管理员' || (form['consultation_response_id'] && $check_field('set','consultation_topic')) || (!form['consultation_response_id'] && $check_field('add','consultation_topic'))" :disabled="disabledObj['consultation_topic_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','consultation_topic')">{{form['consultation_topic']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','content') || $check_field('add','content') || $check_field('set','content')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="内容" prop="content">
								<el-input type="textarea" id="content" v-model="form['content']" placeholder="请输入内容"
						v-if="user_group === '管理员' || (form['consultation_response_id'] && $check_field('set','content')) || (!form['consultation_response_id'] && $check_field('add','content'))" :disabled="disabledObj['content_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','content')">{{form['content']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','reply_time') || $check_field('add','reply_time') || $check_field('set','reply_time')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="回复时间" prop="reply_time">
								<el-date-picker :disabled="disabledObj['reply_time_isDisabled']" v-if="user_group === '管理员' || (form['consultation_response_id'] && $check_field('set','reply_time')) || (!form['consultation_response_id'] && $check_field('add','reply_time'))" id="reply_time"
						v-model="form['reply_time']" type="datetime" placeholder="选择日期时间">
					</el-date-picker>
					<div v-else-if="$check_field('get','reply_time')">{{form['reply_time']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','reply') || $check_field('add','reply') || $check_field('set','reply')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="回复" prop="reply">
								<el-input type="textarea" id="reply" v-model="form['reply']" placeholder="请输入回复"
						v-if="user_group === '管理员' || (form['consultation_response_id'] && $check_field('set','reply')) || (!form['consultation_response_id'] && $check_field('add','reply'))" :disabled="disabledObj['reply_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','reply')">{{form['reply']}}</div>
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
				field: "consultation_response_id",
				url_add: "~/api/consultation_response/add?",
				url_set: "~/api/consultation_response/set?",
				url_get_obj: "~/api/consultation_response/get_obj?",
				url_upload: "~/api/consultation_response/upload?",

				query: {
					"consultation_response_id": 0,
				},

				form: {
								"member_account": 0, // 会员账号
										"member_name":  '', // 会员姓名
										"member_gender":  '', // 会员性别
										"doctor_account": 0, // 医生账号
										"doctor_no":  '', // 医生编号
										"doctors_name":  '', // 医生姓名
										"consultation_topic":  '', // 咨询主题
										"content":  '', // 内容
										"reply_time":  '', // 回复时间
										"reply":  '', // 回复
											"consultation_response_id": 0, // ID
						
				},
				disabledObj:{
								"member_account_isDisabled": false,
										"member_name_isDisabled": false,
										"member_gender_isDisabled": false,
										"doctor_account_isDisabled": false,
										"doctor_no_isDisabled": false,
										"doctors_name_isDisabled": false,
										"consultation_topic_isDisabled": false,
										"content_isDisabled": false,
										"reply_time_isDisabled": false,
										"reply_isDisabled": false,
										},

	
					// 用户列表
				list_user_member_account: [],
						// 用户组
				group_user_member_account: "",
				
		
		
					// 用户列表
				list_user_doctor_account: [],
				
		
		
		
		
		
	
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
			 * 获取医生用户用户列表
			 */
			async get_list_user_doctor_account() {
                // if(this.user_group !== "管理员" && this.form["doctor_account"] === 0) {
                //     this.form["doctor_account"] = this.user.user_id;
                // }
                var json = await this.$get("~/api/user/get_list?user_group=医生用户");
                if(json.result && json.result.list){
                    this.list_user_doctor_account = json.result.list;
                }
                else if(json.error){
                    console.error(json.error);
                }
			},
					get_user_doctor_account(id){
				var obj = this.list_user_doctor_account.getObj({"user_id":id});
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
																								// 获取缓存数据附加
				form = $.db.get("form");
							$.push(this.form ,form);
													
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
																	        if (this.form["reply_time"].indexOf("-")===-1){
            this.form["reply_time"] = this.$toTime(parseInt(this.form["reply_time"]),"yyyy-MM-dd hh:mm:ss")
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


																									        if(this.form["reply_time"]=="0000-00-00 00:00:00"){
          this.form["reply_time"] = null;
        }
				if(parseInt(this.form["reply_time"]) > 9999){
					this.form["reply_time"] = this.$toTime(parseInt(this.form["reply_time"]),"yyyy-MM-dd hh:mm:ss")
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
					bl = this.$check_action('/consultation_response/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/consultation_response/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/consultation_response/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/consultation_response/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/consultation_response/view','get');
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
												this.get_list_user_doctor_account();
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
