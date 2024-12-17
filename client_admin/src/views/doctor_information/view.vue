<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','doctor_account') || $check_field('add','doctor_account') || $check_field('set','doctor_account')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="医生账号" prop="doctor_account">
																		<div v-if="user_group !== '管理员'">
							{{ get_user_session_doctor_account(form['doctor_account']) }}
							<!--<el-input id="business_name" v-model="form['doctor_account']" placeholder="请输入医生账号"-->
							<!--v-if="user_group === '管理员' || (form['doctor_information_id'] && $check_field('set','doctor_account')) || (!form['doctor_information_id'] && $check_field('add','doctor_account'))" :disabled="disabledObj['doctor_account_isDisabled']"></el-input>-->
							<!--<div v-else-if="$check_field('get','doctor_account')">{{form['doctor_account']}}</div>-->
							<el-select v-if="user_group === '管理员' || (form['doctor_information_id'] && $check_field('set','doctor_account')) || (!form['doctor_information_id'] && $check_field('add','doctor_account'))" id="doctor_account" v-model="form['doctor_account']" :disabled="disabledObj['doctor_account_isDisabled']">
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
							  v-if="user_group === '管理员' || (form['doctor_information_id'] && $check_field('set','doctor_no')) || (!form['doctor_information_id'] && $check_field('add','doctor_no'))" :disabled="disabledObj['doctor_no_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','doctor_no')">{{form['doctor_no']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','doctors_name') || $check_field('add','doctors_name') || $check_field('set','doctors_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="医生姓名" prop="doctors_name">
												<el-input id="doctors_name" v-model="form['doctors_name']" placeholder="请输入医生姓名"
							  v-if="user_group === '管理员' || (form['doctor_information_id'] && $check_field('set','doctors_name')) || (!form['doctor_information_id'] && $check_field('add','doctors_name'))" :disabled="disabledObj['doctors_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','doctors_name')">{{form['doctors_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','doctors_photo') || $check_field('add','doctors_photo') || $check_field('set','doctors_photo')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="医生照片" prop="doctors_photo">
								<el-upload :disabled="disabledObj['doctors_photo_isDisabled']" id="doctors_photo" class="avatar-uploader" drag
						accept="image/gif, image/jpeg, image/png, image/jpg" action="" :http-request="upload_doctors_photo"
						:show-file-list="false" v-if="user_group === '管理员' || (form['doctor_information_id'] && $check_field('set','doctors_photo')) || (!form['doctor_information_id'] && $check_field('add','doctors_photo'))">
						<img v-if="form['doctors_photo']" :src="$fullUrl(form['doctors_photo'])" class="avatar">
						<i v-else class="el-icon-plus avatar-uploader-icon"></i>
					</el-upload>
					<el-image v-else-if="$check_field('get','doctors_photo')" style="width: 100px; height: 100px"
						:src="$fullUrl(form['doctors_photo'])" :preview-src-list="[$fullUrl(form['doctors_photo'])]">
						<div slot="error" class="image-slot">
							<img src="../../../public/img/error.png" style="width: 90px; height: 90px" />
						</div>
					</el-image>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','doctors_gender') || $check_field('add','doctors_gender') || $check_field('set','doctors_gender')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="医生性别" prop="doctors_gender">
												<el-input id="doctors_gender" v-model="form['doctors_gender']" placeholder="请输入医生性别"
							  v-if="user_group === '管理员' || (form['doctor_information_id'] && $check_field('set','doctors_gender')) || (!form['doctor_information_id'] && $check_field('add','doctors_gender'))" :disabled="disabledObj['doctors_gender_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','doctors_gender')">{{form['doctors_gender']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','employment_time') || $check_field('add','employment_time') || $check_field('set','employment_time')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="从业时间" prop="employment_time">
												<el-input id="employment_time" v-model="form['employment_time']" placeholder="请输入从业时间"
							  v-if="user_group === '管理员' || (form['doctor_information_id'] && $check_field('set','employment_time')) || (!form['doctor_information_id'] && $check_field('add','employment_time'))" :disabled="disabledObj['employment_time_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','employment_time')">{{form['employment_time']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','doctor_introduction') || $check_field('add','doctor_introduction') || $check_field('set','doctor_introduction')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="医生简介" prop="doctor_introduction">
								<el-input type="textarea" id="doctor_introduction" v-model="form['doctor_introduction']" placeholder="请输入医生简介"
						v-if="user_group === '管理员' || (form['doctor_information_id'] && $check_field('set','doctor_introduction')) || (!form['doctor_information_id'] && $check_field('add','doctor_introduction'))" :disabled="disabledObj['doctor_introduction_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','doctor_introduction')">{{form['doctor_introduction']}}</div>
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
				field: "doctor_information_id",
				url_add: "~/api/doctor_information/add?",
				url_set: "~/api/doctor_information/set?",
				url_get_obj: "~/api/doctor_information/get_obj?",
				url_upload: "~/api/doctor_information/upload?",

				query: {
					"doctor_information_id": 0,
				},

				form: {
								"doctor_account": 0, // 医生账号
										"doctor_no":  '', // 医生编号
										"doctors_name":  '', // 医生姓名
										"doctors_photo":  '', // 医生照片
										"doctors_gender":  '', // 医生性别
										"employment_time":  '', // 从业时间
										"doctor_introduction":  '', // 医生简介
											"doctor_information_id": 0, // ID
						
				},
				disabledObj:{
								"doctor_account_isDisabled": false,
										"doctor_no_isDisabled": false,
										"doctors_name_isDisabled": false,
										"doctors_photo_isDisabled": false,
										"doctors_gender_isDisabled": false,
										"employment_time_isDisabled": false,
										"doctor_introduction_isDisabled": false,
										},

	
					// 用户列表
				list_user_doctor_account: [],
						// 用户组
				group_user_doctor_account: "",
				
		
		
		
		
		
	
			}
		},
		methods: {


	
	
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
			 * 上传医生照片
			 * @param {Object} param 图片参数
			 */
			upload_doctors_photo(param){
						this.uploadFile(param.file, "doctors_photo");
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
																		$.db.del("form");
				return param;
			},

			/**
			 * 获取对象之后
			 * @param {Object} json
			 * @param {Object} func
			 */
			get_obj_after(json, func){


																					


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
					bl = this.$check_action('/doctor_information/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/doctor_information/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/doctor_information/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/doctor_information/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/doctor_information/view','get');
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
