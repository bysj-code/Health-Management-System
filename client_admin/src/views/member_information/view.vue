<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','member_account') || $check_field('add','member_account') || $check_field('set','member_account')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="会员账号" prop="member_account">
													<el-select v-if="user_group === '管理员' || (form['member_information_id'] && $check_field('set','member_account')) || (!form['member_information_id'] && $check_field('add','member_account'))" id="member_account" v-model="form['member_account']" :disabled="disabledObj['member_account_isDisabled']">
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
							  v-if="user_group === '管理员' || (form['member_information_id'] && $check_field('set','member_name')) || (!form['member_information_id'] && $check_field('add','member_name'))" :disabled="disabledObj['member_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','member_name')">{{form['member_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','member_gender') || $check_field('add','member_gender') || $check_field('set','member_gender')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="会员性别" prop="member_gender">
												<el-input id="member_gender" v-model="form['member_gender']" placeholder="请输入会员性别"
							  v-if="user_group === '管理员' || (form['member_information_id'] && $check_field('set','member_gender')) || (!form['member_information_id'] && $check_field('add','member_gender'))" :disabled="disabledObj['member_gender_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','member_gender')">{{form['member_gender']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','last_physical_examination') || $check_field('add','last_physical_examination') || $check_field('set','last_physical_examination')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="上次体检" prop="last_physical_examination">
								<el-date-picker :disabled="disabledObj['last_physical_examination_isDisabled']" v-if="user_group === '管理员' || (form['member_information_id'] && $check_field('set','last_physical_examination')) || (!form['member_information_id'] && $check_field('add','last_physical_examination'))" id="last_physical_examination"
						v-model="form['last_physical_examination']" type="date" placeholder="选择日期">
					</el-date-picker>
					<div v-else-if="$check_field('get','last_physical_examination')">{{form['last_physical_examination']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','identification_number') || $check_field('add','identification_number') || $check_field('set','identification_number')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="证件号码" prop="identification_number">
												<el-input id="identification_number" v-model="form['identification_number']" placeholder="请输入证件号码"
							  v-if="user_group === '管理员' || (form['member_information_id'] && $check_field('set','identification_number')) || (!form['member_information_id'] && $check_field('add','identification_number'))" :disabled="disabledObj['identification_number_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','identification_number')">{{form['identification_number']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','contact_information') || $check_field('add','contact_information') || $check_field('set','contact_information')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="联系方式" prop="contact_information">
												<el-input id="contact_information" v-model="form['contact_information']" placeholder="请输入联系方式"
							  v-if="user_group === '管理员' || (form['member_information_id'] && $check_field('set','contact_information')) || (!form['member_information_id'] && $check_field('add','contact_information'))" :disabled="disabledObj['contact_information_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','contact_information')">{{form['contact_information']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','residential_address') || $check_field('add','residential_address') || $check_field('set','residential_address')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="居住地址" prop="residential_address">
								<el-input type="textarea" id="residential_address" v-model="form['residential_address']" placeholder="请输入居住地址"
						v-if="user_group === '管理员' || (form['member_information_id'] && $check_field('set','residential_address')) || (!form['member_information_id'] && $check_field('add','residential_address'))" :disabled="disabledObj['residential_address_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','residential_address')">{{form['residential_address']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','member_notes') || $check_field('add','member_notes') || $check_field('set','member_notes')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="会员备注" prop="member_notes">
								<el-input type="textarea" id="member_notes" v-model="form['member_notes']" placeholder="请输入会员备注"
						v-if="user_group === '管理员' || (form['member_information_id'] && $check_field('set','member_notes')) || (!form['member_information_id'] && $check_field('add','member_notes'))" :disabled="disabledObj['member_notes_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','member_notes')">{{form['member_notes']}}</div>
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
				field: "member_information_id",
				url_add: "~/api/member_information/add?",
				url_set: "~/api/member_information/set?",
				url_get_obj: "~/api/member_information/get_obj?",
				url_upload: "~/api/member_information/upload?",

				query: {
					"member_information_id": 0,
				},

				form: {
								"member_account": 0, // 会员账号
										"member_name":  '', // 会员姓名
										"member_gender":  '', // 会员性别
										"last_physical_examination":  '', // 上次体检
										"identification_number":  '', // 证件号码
										"contact_information":  '', // 联系方式
										"residential_address":  '', // 居住地址
										"member_notes":  '', // 会员备注
											"member_information_id": 0, // ID
						
				},
				disabledObj:{
								"member_account_isDisabled": false,
										"member_name_isDisabled": false,
										"member_gender_isDisabled": false,
										"last_physical_examination_isDisabled": false,
										"identification_number_isDisabled": false,
										"contact_information_isDisabled": false,
										"residential_address_isDisabled": false,
										"member_notes_isDisabled": false,
										},

	
					// 用户列表
				list_user_member_account: [],
				
		
		
		
		
		
		
	
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
								        if (this.form["last_physical_examination"].indexOf("-")===-1){
          this.form["last_physical_examination"] = this.$toTime(parseInt(this.form["last_physical_examination"]),"yyyy-MM-dd")
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


											        if(this.form["last_physical_examination"]=="0000-00-00"){
          this.form["last_physical_examination"] = null;
        }
				if(parseInt(this.form["last_physical_examination"]) > 9999){
					this.form["last_physical_examination"] = this.$toTime(parseInt(this.form["last_physical_examination"]),"yyyy-MM-dd")
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
					bl = this.$check_action('/member_information/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/member_information/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/member_information/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/member_information/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/member_information/view','get');
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
