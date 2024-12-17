<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','member_account') || $check_field('add','member_account') || $check_field('set','member_account')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="会员账号" prop="member_account">
													<el-select v-if="user_group === '管理员' || (form['health_assessment_id'] && $check_field('set','member_account')) || (!form['health_assessment_id'] && $check_field('add','member_account'))" id="member_account" v-model="form['member_account']" :disabled="disabledObj['member_account_isDisabled']">
							<el-option v-for="o in list_user_member_account" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
						<el-select v-else-if="$check_field('get','member_account')" id="member_account" v-model="form['member_account']" :disabled="true">
							<el-option v-for="o in list_user_member_account" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','member_name') || $check_field('add','member_name') || $check_field('set','member_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="会员姓名" prop="member_name">
												<el-input id="member_name" v-model="form['member_name']" placeholder="请输入会员姓名"
							  v-if="user_group === '管理员' || (form['health_assessment_id'] && $check_field('set','member_name')) || (!form['health_assessment_id'] && $check_field('add','member_name'))" :disabled="disabledObj['member_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','member_name')">{{form['member_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','member_gender') || $check_field('add','member_gender') || $check_field('set','member_gender')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="会员性别" prop="member_gender">
												<el-input id="member_gender" v-model="form['member_gender']" placeholder="请输入会员性别"
							  v-if="user_group === '管理员' || (form['health_assessment_id'] && $check_field('set','member_gender')) || (!form['health_assessment_id'] && $check_field('add','member_gender'))" :disabled="disabledObj['member_gender_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','member_gender')">{{form['member_gender']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','doctor_account') || $check_field('add','doctor_account') || $check_field('set','doctor_account')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="医生账号" prop="doctor_account">
																		<div v-if="user_group !== '管理员'">
							{{ get_user_session_doctor_account(form['doctor_account']) }}
							<!--<el-input id="business_name" v-model="form['doctor_account']" placeholder="请输入医生账号"-->
							<!--v-if="user_group === '管理员' || (form['health_assessment_id'] && $check_field('set','doctor_account')) || (!form['health_assessment_id'] && $check_field('add','doctor_account'))" :disabled="disabledObj['doctor_account_isDisabled']"></el-input>-->
							<!--<div v-else-if="$check_field('get','doctor_account')">{{form['doctor_account']}}</div>-->
							<el-select v-if="user_group === '管理员' || (form['health_assessment_id'] && $check_field('set','doctor_account')) || (!form['health_assessment_id'] && $check_field('add','doctor_account'))" id="doctor_account" v-model="form['doctor_account']" :disabled="disabledObj['doctor_account_isDisabled']">
								<el-option v-for="o in list_user_doctor_account" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
							<el-select v-else-if="$check_field('get','doctor_account')" id="doctor_account" v-model="form['doctor_account']" :disabled="true">
								<el-option v-for="o in list_user_doctor_account" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
						</div>
						<el-select v-else id="doctor_account" v-model="form['doctor_account']" :disabled="disabledObj['doctor_account_isDisabled']">
							<el-option v-for="o in list_user_doctor_account" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
																</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','doctor_no') || $check_field('add','doctor_no') || $check_field('set','doctor_no')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="医生编号" prop="doctor_no">
												<el-input id="doctor_no" v-model="form['doctor_no']" placeholder="请输入医生编号"
							  v-if="user_group === '管理员' || (form['health_assessment_id'] && $check_field('set','doctor_no')) || (!form['health_assessment_id'] && $check_field('add','doctor_no'))" :disabled="disabledObj['doctor_no_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','doctor_no')">{{form['doctor_no']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','doctors_name') || $check_field('add','doctors_name') || $check_field('set','doctors_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="医生姓名" prop="doctors_name">
												<el-input id="doctors_name" v-model="form['doctors_name']" placeholder="请输入医生姓名"
							  v-if="user_group === '管理员' || (form['health_assessment_id'] && $check_field('set','doctors_name')) || (!form['health_assessment_id'] && $check_field('add','doctors_name'))" :disabled="disabledObj['doctors_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','doctors_name')">{{form['doctors_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','report_name') || $check_field('add','report_name') || $check_field('set','report_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="报告名称" prop="report_name">
												<el-input id="report_name" v-model="form['report_name']" placeholder="请输入报告名称"
							  v-if="user_group === '管理员' || (form['health_assessment_id'] && $check_field('set','report_name')) || (!form['health_assessment_id'] && $check_field('add','report_name'))" :disabled="disabledObj['report_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','report_name')">{{form['report_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','evaluation_date') || $check_field('add','evaluation_date') || $check_field('set','evaluation_date')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="评估日期" prop="evaluation_date">
								<el-date-picker :disabled="disabledObj['evaluation_date_isDisabled']" v-if="user_group === '管理员' || (form['health_assessment_id'] && $check_field('set','evaluation_date')) || (!form['health_assessment_id'] && $check_field('add','evaluation_date'))" id="evaluation_date"
						v-model="form['evaluation_date']" type="date" placeholder="选择日期">
					</el-date-picker>
					<div v-else-if="$check_field('get','evaluation_date')">{{form['evaluation_date']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','physical_assessment') || $check_field('add','physical_assessment') || $check_field('set','physical_assessment')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="体质评估" prop="physical_assessment">
								<el-input type="textarea" id="physical_assessment" v-model="form['physical_assessment']" placeholder="请输入体质评估"
						v-if="user_group === '管理员' || (form['health_assessment_id'] && $check_field('set','physical_assessment')) || (!form['health_assessment_id'] && $check_field('add','physical_assessment'))" :disabled="disabledObj['physical_assessment_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','physical_assessment')">{{form['physical_assessment']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','psychological_assessment') || $check_field('add','psychological_assessment') || $check_field('set','psychological_assessment')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="心理评估" prop="psychological_assessment">
								<el-input type="textarea" id="psychological_assessment" v-model="form['psychological_assessment']" placeholder="请输入心理评估"
						v-if="user_group === '管理员' || (form['health_assessment_id'] && $check_field('set','psychological_assessment')) || (!form['health_assessment_id'] && $check_field('add','psychological_assessment'))" :disabled="disabledObj['psychological_assessment_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','psychological_assessment')">{{form['psychological_assessment']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','doctors_advice') || $check_field('add','doctors_advice') || $check_field('set','doctors_advice')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="医生建议" prop="doctors_advice">
								<el-input type="textarea" id="doctors_advice" v-model="form['doctors_advice']" placeholder="请输入医生建议"
						v-if="user_group === '管理员' || (form['health_assessment_id'] && $check_field('set','doctors_advice')) || (!form['health_assessment_id'] && $check_field('add','doctors_advice'))" :disabled="disabledObj['doctors_advice_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','doctors_advice')">{{form['doctors_advice']}}</div>
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
				field: "health_assessment_id",
				url_add: "~/api/health_assessment/add?",
				url_set: "~/api/health_assessment/set?",
				url_get_obj: "~/api/health_assessment/get_obj?",
				url_upload: "~/api/health_assessment/upload?",

				query: {
					"health_assessment_id": 0,
				},

				form: {
								"member_account": 0, // 会员账号
										"member_name":  '', // 会员姓名
										"member_gender":  '', // 会员性别
										"doctor_account": 0, // 医生账号
										"doctor_no":  '', // 医生编号
										"doctors_name":  '', // 医生姓名
										"report_name":  '', // 报告名称
										"evaluation_date":  '', // 评估日期
										"physical_assessment":  '', // 体质评估
										"psychological_assessment":  '', // 心理评估
										"doctors_advice":  '', // 医生建议
											"health_assessment_id": 0, // ID
						
				},
				disabledObj:{
								"member_account_isDisabled": false,
										"member_name_isDisabled": false,
										"member_gender_isDisabled": false,
										"doctor_account_isDisabled": false,
										"doctor_no_isDisabled": false,
										"doctors_name_isDisabled": false,
										"report_name_isDisabled": false,
										"evaluation_date_isDisabled": false,
										"physical_assessment_isDisabled": false,
										"psychological_assessment_isDisabled": false,
										"doctors_advice_isDisabled": false,
										},

	
					// 用户列表
				list_user_member_account: [],
				
		
		
					// 用户列表
				list_user_doctor_account: [],
						// 用户组
				group_user_doctor_account: "",
				
		
		
		
		
		
		
	
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
					/**
			 * 获取医生用户用户组
			 */
			async get_group_user_doctor_account() {
							this.form["doctor_account"] = this.user.user_id;
							var json = await this.$get("~/api/user_group/get_obj?name=医生用户");
				if(json.result && json.result.obj){
					this.group_user_doctor_account = json.result.obj;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
			get_user_session_doctor_account(id){
				var _this = this;
				var user_id = {"user_id":id}
				var url = "~/api/"+_this.group_user_doctor_account.source_table+"/get_obj?"
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
												_this.form["doctor_account"] = id
									_this.disabledObj['doctor_account' + '_isDisabled'] = true
						for (var i=0;i<arr.length;i++){
						  if (arr[i]!=='examine_state' && arr[i]!=='examine_reply') {
							for (var j = 0; j < arrForm.length; j++) {
							  if (arr[i] === arrForm[j]) {
								if (arr[i] !== "doctor_account") {
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
																        if (this.form["evaluation_date"].indexOf("-")===-1){
          this.form["evaluation_date"] = this.$toTime(parseInt(this.form["evaluation_date"]),"yyyy-MM-dd")
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


																							        if(this.form["evaluation_date"]=="0000-00-00"){
          this.form["evaluation_date"] = null;
        }
				if(parseInt(this.form["evaluation_date"]) > 9999){
					this.form["evaluation_date"] = this.$toTime(parseInt(this.form["evaluation_date"]),"yyyy-MM-dd")
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
					bl = this.$check_action('/health_assessment/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/health_assessment/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/health_assessment/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/health_assessment/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/health_assessment/view','get');
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
												this.get_list_user_doctor_account();
					this.get_group_user_doctor_account();
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
