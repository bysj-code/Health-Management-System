<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','member_account') || $check_field('add','member_account') || $check_field('set','member_account')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="会员账号" prop="member_account">
													<el-select v-if="user_group === '管理员' || (form['health_records_id'] && $check_field('set','member_account')) || (!form['health_records_id'] && $check_field('add','member_account'))" id="member_account" v-model="form['member_account']" :disabled="disabledObj['member_account_isDisabled']">
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
							  v-if="user_group === '管理员' || (form['health_records_id'] && $check_field('set','member_name')) || (!form['health_records_id'] && $check_field('add','member_name'))" :disabled="disabledObj['member_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','member_name')">{{form['member_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','member_gender') || $check_field('add','member_gender') || $check_field('set','member_gender')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="会员性别" prop="member_gender">
												<el-input id="member_gender" v-model="form['member_gender']" placeholder="请输入会员性别"
							  v-if="user_group === '管理员' || (form['health_records_id'] && $check_field('set','member_gender')) || (!form['health_records_id'] && $check_field('add','member_gender'))" :disabled="disabledObj['member_gender_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','member_gender')">{{form['member_gender']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','report_name') || $check_field('add','report_name') || $check_field('set','report_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="报告名称" prop="report_name">
												<el-input id="report_name" v-model="form['report_name']" placeholder="请输入报告名称"
							  v-if="user_group === '管理员' || (form['health_records_id'] && $check_field('set','report_name')) || (!form['health_records_id'] && $check_field('add','report_name'))" :disabled="disabledObj['report_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','report_name')">{{form['report_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','physical_examination_time') || $check_field('add','physical_examination_time') || $check_field('set','physical_examination_time')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="体检时间" prop="physical_examination_time">
								<el-date-picker :disabled="disabledObj['physical_examination_time_isDisabled']" v-if="user_group === '管理员' || (form['health_records_id'] && $check_field('set','physical_examination_time')) || (!form['health_records_id'] && $check_field('add','physical_examination_time'))" id="physical_examination_time"
						v-model="form['physical_examination_time']" type="date" placeholder="选择日期">
					</el-date-picker>
					<div v-else-if="$check_field('get','physical_examination_time')">{{form['physical_examination_time']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','height_cm') || $check_field('add','height_cm') || $check_field('set','height_cm')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="身高/cm" prop="height_cm">
												<el-input id="height_cm" v-model="form['height_cm']" placeholder="请输入身高/cm"
							  v-if="user_group === '管理员' || (form['health_records_id'] && $check_field('set','height_cm')) || (!form['health_records_id'] && $check_field('add','height_cm'))" :disabled="disabledObj['height_cm_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','height_cm')">{{form['height_cm']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','body_weightkg') || $check_field('add','body_weightkg') || $check_field('set','body_weightkg')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="体重/kg" prop="body_weightkg">
												<el-input id="body_weightkg" v-model="form['body_weightkg']" placeholder="请输入体重/kg"
							  v-if="user_group === '管理员' || (form['health_records_id'] && $check_field('set','body_weightkg')) || (!form['health_records_id'] && $check_field('add','body_weightkg'))" :disabled="disabledObj['body_weightkg_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','body_weightkg')">{{form['body_weightkg']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','blood_pressure_data') || $check_field('add','blood_pressure_data') || $check_field('set','blood_pressure_data')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="血压数据" prop="blood_pressure_data">
												<el-input id="blood_pressure_data" v-model="form['blood_pressure_data']" placeholder="请输入血压数据"
							  v-if="user_group === '管理员' || (form['health_records_id'] && $check_field('set','blood_pressure_data')) || (!form['health_records_id'] && $check_field('add','blood_pressure_data'))" :disabled="disabledObj['blood_pressure_data_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','blood_pressure_data')">{{form['blood_pressure_data']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','routine_blood_test') || $check_field('add','routine_blood_test') || $check_field('set','routine_blood_test')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="血常规" prop="routine_blood_test">
								<el-upload :disabled="disabledObj['routine_blood_test_isDisabled']" id="routine_blood_test" class="avatar-uploader" drag
						accept="image/gif, image/jpeg, image/png, image/jpg" action="" :http-request="upload_routine_blood_test"
						:show-file-list="false" v-if="user_group === '管理员' || (form['health_records_id'] && $check_field('set','routine_blood_test')) || (!form['health_records_id'] && $check_field('add','routine_blood_test'))">
						<img v-if="form['routine_blood_test']" :src="$fullUrl(form['routine_blood_test'])" class="avatar">
						<i v-else class="el-icon-plus avatar-uploader-icon"></i>
					</el-upload>
					<el-image v-else-if="$check_field('get','routine_blood_test')" style="width: 100px; height: 100px"
						:src="$fullUrl(form['routine_blood_test'])" :preview-src-list="[$fullUrl(form['routine_blood_test'])]">
						<div slot="error" class="image-slot">
							<img src="../../../public/img/error.png" style="width: 90px; height: 90px" />
						</div>
					</el-image>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','urinalysis') || $check_field('add','urinalysis') || $check_field('set','urinalysis')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="尿常规" prop="urinalysis">
								<el-upload :disabled="disabledObj['urinalysis_isDisabled']" id="urinalysis" class="avatar-uploader" drag
						accept="image/gif, image/jpeg, image/png, image/jpg" action="" :http-request="upload_urinalysis"
						:show-file-list="false" v-if="user_group === '管理员' || (form['health_records_id'] && $check_field('set','urinalysis')) || (!form['health_records_id'] && $check_field('add','urinalysis'))">
						<img v-if="form['urinalysis']" :src="$fullUrl(form['urinalysis'])" class="avatar">
						<i v-else class="el-icon-plus avatar-uploader-icon"></i>
					</el-upload>
					<el-image v-else-if="$check_field('get','urinalysis')" style="width: 100px; height: 100px"
						:src="$fullUrl(form['urinalysis'])" :preview-src-list="[$fullUrl(form['urinalysis'])]">
						<div slot="error" class="image-slot">
							<img src="../../../public/img/error.png" style="width: 90px; height: 90px" />
						</div>
					</el-image>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','liver_function') || $check_field('add','liver_function') || $check_field('set','liver_function')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="肝功能" prop="liver_function">
								<el-upload :disabled="disabledObj['liver_function_isDisabled']" id="liver_function" class="avatar-uploader" drag
						accept="image/gif, image/jpeg, image/png, image/jpg" action="" :http-request="upload_liver_function"
						:show-file-list="false" v-if="user_group === '管理员' || (form['health_records_id'] && $check_field('set','liver_function')) || (!form['health_records_id'] && $check_field('add','liver_function'))">
						<img v-if="form['liver_function']" :src="$fullUrl(form['liver_function'])" class="avatar">
						<i v-else class="el-icon-plus avatar-uploader-icon"></i>
					</el-upload>
					<el-image v-else-if="$check_field('get','liver_function')" style="width: 100px; height: 100px"
						:src="$fullUrl(form['liver_function'])" :preview-src-list="[$fullUrl(form['liver_function'])]">
						<div slot="error" class="image-slot">
							<img src="../../../public/img/error.png" style="width: 90px; height: 90px" />
						</div>
					</el-image>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','renal_function') || $check_field('add','renal_function') || $check_field('set','renal_function')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="肾功能" prop="renal_function">
								<el-upload :disabled="disabledObj['renal_function_isDisabled']" id="renal_function" class="avatar-uploader" drag
						accept="image/gif, image/jpeg, image/png, image/jpg" action="" :http-request="upload_renal_function"
						:show-file-list="false" v-if="user_group === '管理员' || (form['health_records_id'] && $check_field('set','renal_function')) || (!form['health_records_id'] && $check_field('add','renal_function'))">
						<img v-if="form['renal_function']" :src="$fullUrl(form['renal_function'])" class="avatar">
						<i v-else class="el-icon-plus avatar-uploader-icon"></i>
					</el-upload>
					<el-image v-else-if="$check_field('get','renal_function')" style="width: 100px; height: 100px"
						:src="$fullUrl(form['renal_function'])" :preview-src-list="[$fullUrl(form['renal_function'])]">
						<div slot="error" class="image-slot">
							<img src="../../../public/img/error.png" style="width: 90px; height: 90px" />
						</div>
					</el-image>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','electrocardiogram') || $check_field('add','electrocardiogram') || $check_field('set','electrocardiogram')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="心电图" prop="electrocardiogram">
								<el-upload :disabled="disabledObj['electrocardiogram_isDisabled']" id="electrocardiogram" class="avatar-uploader" drag
						accept="image/gif, image/jpeg, image/png, image/jpg" action="" :http-request="upload_electrocardiogram"
						:show-file-list="false" v-if="user_group === '管理员' || (form['health_records_id'] && $check_field('set','electrocardiogram')) || (!form['health_records_id'] && $check_field('add','electrocardiogram'))">
						<img v-if="form['electrocardiogram']" :src="$fullUrl(form['electrocardiogram'])" class="avatar">
						<i v-else class="el-icon-plus avatar-uploader-icon"></i>
					</el-upload>
					<el-image v-else-if="$check_field('get','electrocardiogram')" style="width: 100px; height: 100px"
						:src="$fullUrl(form['electrocardiogram'])" :preview-src-list="[$fullUrl(form['electrocardiogram'])]">
						<div slot="error" class="image-slot">
							<img src="../../../public/img/error.png" style="width: 90px; height: 90px" />
						</div>
					</el-image>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','ultrasound_imaging') || $check_field('add','ultrasound_imaging') || $check_field('set','ultrasound_imaging')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="超声影像" prop="ultrasound_imaging">
								<el-upload :disabled="disabledObj['ultrasound_imaging_isDisabled']" id="ultrasound_imaging" class="avatar-uploader" drag
						accept="image/gif, image/jpeg, image/png, image/jpg" action="" :http-request="upload_ultrasound_imaging"
						:show-file-list="false" v-if="user_group === '管理员' || (form['health_records_id'] && $check_field('set','ultrasound_imaging')) || (!form['health_records_id'] && $check_field('add','ultrasound_imaging'))">
						<img v-if="form['ultrasound_imaging']" :src="$fullUrl(form['ultrasound_imaging'])" class="avatar">
						<i v-else class="el-icon-plus avatar-uploader-icon"></i>
					</el-upload>
					<el-image v-else-if="$check_field('get','ultrasound_imaging')" style="width: 100px; height: 100px"
						:src="$fullUrl(form['ultrasound_imaging'])" :preview-src-list="[$fullUrl(form['ultrasound_imaging'])]">
						<div slot="error" class="image-slot">
							<img src="../../../public/img/error.png" style="width: 90px; height: 90px" />
						</div>
					</el-image>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','ct_examination') || $check_field('add','ct_examination') || $check_field('set','ct_examination')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="CT检查" prop="ct_examination">
								<el-upload :disabled="disabledObj['ct_examination_isDisabled']" id="ct_examination" class="avatar-uploader" drag
						accept="image/gif, image/jpeg, image/png, image/jpg" action="" :http-request="upload_ct_examination"
						:show-file-list="false" v-if="user_group === '管理员' || (form['health_records_id'] && $check_field('set','ct_examination')) || (!form['health_records_id'] && $check_field('add','ct_examination'))">
						<img v-if="form['ct_examination']" :src="$fullUrl(form['ct_examination'])" class="avatar">
						<i v-else class="el-icon-plus avatar-uploader-icon"></i>
					</el-upload>
					<el-image v-else-if="$check_field('get','ct_examination')" style="width: 100px; height: 100px"
						:src="$fullUrl(form['ct_examination'])" :preview-src-list="[$fullUrl(form['ct_examination'])]">
						<div slot="error" class="image-slot">
							<img src="../../../public/img/error.png" style="width: 90px; height: 90px" />
						</div>
					</el-image>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','other_inspections') || $check_field('add','other_inspections') || $check_field('set','other_inspections')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="其他检查" prop="other_inspections">
								<el-input type="textarea" id="other_inspections" v-model="form['other_inspections']" placeholder="请输入其他检查"
						v-if="user_group === '管理员' || (form['health_records_id'] && $check_field('set','other_inspections')) || (!form['health_records_id'] && $check_field('add','other_inspections'))" :disabled="disabledObj['other_inspections_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','other_inspections')">{{form['other_inspections']}}</div>
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
				field: "health_records_id",
				url_add: "~/api/health_records/add?",
				url_set: "~/api/health_records/set?",
				url_get_obj: "~/api/health_records/get_obj?",
				url_upload: "~/api/health_records/upload?",

				query: {
					"health_records_id": 0,
				},

				form: {
								"member_account": 0, // 会员账号
										"member_name":  '', // 会员姓名
										"member_gender":  '', // 会员性别
										"report_name":  '', // 报告名称
										"physical_examination_time":  '', // 体检时间
										"height_cm":  '', // 身高/cm
										"body_weightkg":  '', // 体重/kg
										"blood_pressure_data":  '', // 血压数据
										"routine_blood_test":  '', // 血常规
										"urinalysis":  '', // 尿常规
										"liver_function":  '', // 肝功能
										"renal_function":  '', // 肾功能
										"electrocardiogram":  '', // 心电图
										"ultrasound_imaging":  '', // 超声影像
										"ct_examination":  '', // CT检查
										"other_inspections":  '', // 其他检查
											"health_records_id": 0, // ID
						
				},
				disabledObj:{
								"member_account_isDisabled": false,
										"member_name_isDisabled": false,
										"member_gender_isDisabled": false,
										"report_name_isDisabled": false,
										"physical_examination_time_isDisabled": false,
										"height_cm_isDisabled": false,
										"body_weightkg_isDisabled": false,
										"blood_pressure_data_isDisabled": false,
										"routine_blood_test_isDisabled": false,
										"urinalysis_isDisabled": false,
										"liver_function_isDisabled": false,
										"renal_function_isDisabled": false,
										"electrocardiogram_isDisabled": false,
										"ultrasound_imaging_isDisabled": false,
										"ct_examination_isDisabled": false,
										"other_inspections_isDisabled": false,
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
			 * 上传血常规
			 * @param {Object} param 图片参数
			 */
			upload_routine_blood_test(param){
						this.uploadFile(param.file, "routine_blood_test");
					},
	
	
						/**
			 * 上传尿常规
			 * @param {Object} param 图片参数
			 */
			upload_urinalysis(param){
						this.uploadFile(param.file, "urinalysis");
					},
	
	
						/**
			 * 上传肝功能
			 * @param {Object} param 图片参数
			 */
			upload_liver_function(param){
						this.uploadFile(param.file, "liver_function");
					},
	
	
						/**
			 * 上传肾功能
			 * @param {Object} param 图片参数
			 */
			upload_renal_function(param){
						this.uploadFile(param.file, "renal_function");
					},
	
	
						/**
			 * 上传心电图
			 * @param {Object} param 图片参数
			 */
			upload_electrocardiogram(param){
						this.uploadFile(param.file, "electrocardiogram");
					},
	
	
						/**
			 * 上传超声影像
			 * @param {Object} param 图片参数
			 */
			upload_ultrasound_imaging(param){
						this.uploadFile(param.file, "ultrasound_imaging");
					},
	
	
						/**
			 * 上传CT检查
			 * @param {Object} param 图片参数
			 */
			upload_ct_examination(param){
						this.uploadFile(param.file, "ct_examination");
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
										        if (this.form["physical_examination_time"].indexOf("-")===-1){
          this.form["physical_examination_time"] = this.$toTime(parseInt(this.form["physical_examination_time"]),"yyyy-MM-dd")
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


														        if(this.form["physical_examination_time"]=="0000-00-00"){
          this.form["physical_examination_time"] = null;
        }
				if(parseInt(this.form["physical_examination_time"]) > 9999){
					this.form["physical_examination_time"] = this.$toTime(parseInt(this.form["physical_examination_time"]),"yyyy-MM-dd")
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
					bl = this.$check_action('/health_records/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/health_records/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/health_records/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/health_records/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/health_records/view','get');
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
