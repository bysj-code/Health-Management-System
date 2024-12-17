<template>
	<view class="diy_edit page_health_records" id="health_records_edit">
		<view class='warp'>
			<view class='container'>
				<view class='row'>
						<view v-if="$check_field('set','member_account') || $check_field('add','member_account') || $check_field('get','member_account')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								会员账号:
							</text>
						</view>
						<view class="diy_field diy_down diy_text_row diy_select_flex">
							<uni-data-select
									id="form_member_account"
									v-model="form['member_account']"
									:localdata="list_user_member_account"
									:clear="!disabledObj['member_account_isDisabled']"
									:disabled="disabledObj['member_account_isDisabled']"
									v-if="(form['member_account'] && $check_field('set','member_account')) || (!form['member_account'] && $check_field('add','member_account'))"
							></uni-data-select>
							<text v-else-if="$check_field('get','member_account')">{{ form['member_account'] }}</text>
						</view>
					</view>
							<view v-if="$check_field('set','member_name') || $check_field('add','member_name') || $check_field('get','member_name')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								会员姓名:
							</text>
						</view>
								<!-- 文本 -->
									<view class="diy_field diy_text diy_text_row">
							<input type="text" id="form_member_name" v-model="form['member_name']" placeholder="请输入会员姓名" v-if="(form['member_name'] && $check_field('set','member_name')) || (!form['member_name'] && $check_field('add','member_name'))" :disabled="disabledObj['member_name_isDisabled']" />
							<text v-else-if="$check_field('get','member_name')">{{ form['member_name'] }}</text>
						</view>
										</view>
							<view v-if="$check_field('set','member_gender') || $check_field('add','member_gender') || $check_field('get','member_gender')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								会员性别:
							</text>
						</view>
								<!-- 文本 -->
									<view class="diy_field diy_text diy_text_row">
							<input type="text" id="form_member_gender" v-model="form['member_gender']" placeholder="请输入会员性别" v-if="(form['member_gender'] && $check_field('set','member_gender')) || (!form['member_gender'] && $check_field('add','member_gender'))" :disabled="disabledObj['member_gender_isDisabled']" />
							<text v-else-if="$check_field('get','member_gender')">{{ form['member_gender'] }}</text>
						</view>
										</view>
							<view v-if="$check_field('set','report_name') || $check_field('add','report_name') || $check_field('get','report_name')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								报告名称:
							</text>
						</view>
								<!-- 文本 -->
									<view class="diy_field diy_text diy_text_row">
							<input type="text" id="form_report_name" v-model="form['report_name']" placeholder="请输入报告名称" v-if="(form['report_name'] && $check_field('set','report_name')) || (!form['report_name'] && $check_field('add','report_name'))" :disabled="disabledObj['report_name_isDisabled']" />
							<text v-else-if="$check_field('get','report_name')">{{ form['report_name'] }}</text>
						</view>
										</view>
							<view v-if="$check_field('set','physical_examination_time') || $check_field('add','physical_examination_time') || $check_field('get','physical_examination_time')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								体检时间:
							</text>
						</view>
								<!-- 日期 -->
						<view class="diy_field diy_date">
							<uni-datetime-picker :disabled="disabledObj['physical_examination_time_isDisabled']" type="date" id="form_physical_examination_time" v-model="form['physical_examination_time']" placeholder="请输入体检时间" v-if="(form['physical_examination_time'] && $check_field('set','physical_examination_time')) || (!form['physical_examination_time'] && $check_field('add','physical_examination_time'))" />
							<text v-else-if="$check_field('get','physical_examination_time')">{{ form['physical_examination_time'] }}</text>
						</view>
							</view>
							<view v-if="$check_field('set','height_cm') || $check_field('add','height_cm') || $check_field('get','height_cm')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								身高/cm:
							</text>
						</view>
								<!-- 文本 -->
									<view class="diy_field diy_text diy_text_row">
							<input type="text" id="form_height_cm" v-model="form['height_cm']" placeholder="请输入身高/cm" v-if="(form['height_cm'] && $check_field('set','height_cm')) || (!form['height_cm'] && $check_field('add','height_cm'))" :disabled="disabledObj['height_cm_isDisabled']" />
							<text v-else-if="$check_field('get','height_cm')">{{ form['height_cm'] }}</text>
						</view>
										</view>
							<view v-if="$check_field('set','body_weightkg') || $check_field('add','body_weightkg') || $check_field('get','body_weightkg')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								体重/kg:
							</text>
						</view>
								<!-- 文本 -->
									<view class="diy_field diy_text diy_text_row">
							<input type="text" id="form_body_weightkg" v-model="form['body_weightkg']" placeholder="请输入体重/kg" v-if="(form['body_weightkg'] && $check_field('set','body_weightkg')) || (!form['body_weightkg'] && $check_field('add','body_weightkg'))" :disabled="disabledObj['body_weightkg_isDisabled']" />
							<text v-else-if="$check_field('get','body_weightkg')">{{ form['body_weightkg'] }}</text>
						</view>
										</view>
							<view v-if="$check_field('set','blood_pressure_data') || $check_field('add','blood_pressure_data') || $check_field('get','blood_pressure_data')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								血压数据:
							</text>
						</view>
								<!-- 文本 -->
									<view class="diy_field diy_text diy_text_row">
							<input type="text" id="form_blood_pressure_data" v-model="form['blood_pressure_data']" placeholder="请输入血压数据" v-if="(form['blood_pressure_data'] && $check_field('set','blood_pressure_data')) || (!form['blood_pressure_data'] && $check_field('add','blood_pressure_data'))" :disabled="disabledObj['blood_pressure_data_isDisabled']" />
							<text v-else-if="$check_field('get','blood_pressure_data')">{{ form['blood_pressure_data'] }}</text>
						</view>
										</view>
							<view v-if="$check_field('set','routine_blood_test') || $check_field('add','routine_blood_test') || $check_field('get','routine_blood_test')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								血常规:
							</text>
						</view>
								<!-- 图片 -->
						<!-- 修改权限 -->
						<view class="diy_field diy_img diy_text_row" v-if="form['routine_blood_test'] && $check_field('set','routine_blood_test')">
							<image v-if="disabledObj['routine_blood_test_isDisabled']" :src="$fullUrl(form['routine_blood_test'])" />
							<image v-if="!disabledObj['routine_blood_test_isDisabled']" :src="$fullUrl(form['routine_blood_test'])" @click="change_img('routine_blood_test')" />
						</view>
						<!-- 添加权限 -->
						<view class="diy_field diy_img diy_text_row" v-else-if="!form['routine_blood_test'] && $check_field('add','routine_blood_test')">
							<view v-if="disabledObj['routine_blood_test_isDisabled']" class="btn_add_img">
								<text>+</text>
							</view>
							<view v-if="!disabledObj['routine_blood_test_isDisabled']" class="btn_add_img diy_text_row" @click="change_img('routine_blood_test')">
								<text>+</text>
							</view>
						</view>
						<!-- 查询权限 -->
						<view class="diy_field diy_img diy_text_row" v-else-if="$check_field('get','routine_blood_test')">
							<image :src="$fullUrl(form['routine_blood_test'])" />
						</view>
						<uni-icons style="display: none;" class="forward" type="forward" id="form_img_routine_blood_test"></uni-icons>
							</view>
							<view v-if="$check_field('set','urinalysis') || $check_field('add','urinalysis') || $check_field('get','urinalysis')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								尿常规:
							</text>
						</view>
								<!-- 图片 -->
						<!-- 修改权限 -->
						<view class="diy_field diy_img diy_text_row" v-if="form['urinalysis'] && $check_field('set','urinalysis')">
							<image v-if="disabledObj['urinalysis_isDisabled']" :src="$fullUrl(form['urinalysis'])" />
							<image v-if="!disabledObj['urinalysis_isDisabled']" :src="$fullUrl(form['urinalysis'])" @click="change_img('urinalysis')" />
						</view>
						<!-- 添加权限 -->
						<view class="diy_field diy_img diy_text_row" v-else-if="!form['urinalysis'] && $check_field('add','urinalysis')">
							<view v-if="disabledObj['urinalysis_isDisabled']" class="btn_add_img">
								<text>+</text>
							</view>
							<view v-if="!disabledObj['urinalysis_isDisabled']" class="btn_add_img diy_text_row" @click="change_img('urinalysis')">
								<text>+</text>
							</view>
						</view>
						<!-- 查询权限 -->
						<view class="diy_field diy_img diy_text_row" v-else-if="$check_field('get','urinalysis')">
							<image :src="$fullUrl(form['urinalysis'])" />
						</view>
						<uni-icons style="display: none;" class="forward" type="forward" id="form_img_urinalysis"></uni-icons>
							</view>
							<view v-if="$check_field('set','liver_function') || $check_field('add','liver_function') || $check_field('get','liver_function')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								肝功能:
							</text>
						</view>
								<!-- 图片 -->
						<!-- 修改权限 -->
						<view class="diy_field diy_img diy_text_row" v-if="form['liver_function'] && $check_field('set','liver_function')">
							<image v-if="disabledObj['liver_function_isDisabled']" :src="$fullUrl(form['liver_function'])" />
							<image v-if="!disabledObj['liver_function_isDisabled']" :src="$fullUrl(form['liver_function'])" @click="change_img('liver_function')" />
						</view>
						<!-- 添加权限 -->
						<view class="diy_field diy_img diy_text_row" v-else-if="!form['liver_function'] && $check_field('add','liver_function')">
							<view v-if="disabledObj['liver_function_isDisabled']" class="btn_add_img">
								<text>+</text>
							</view>
							<view v-if="!disabledObj['liver_function_isDisabled']" class="btn_add_img diy_text_row" @click="change_img('liver_function')">
								<text>+</text>
							</view>
						</view>
						<!-- 查询权限 -->
						<view class="diy_field diy_img diy_text_row" v-else-if="$check_field('get','liver_function')">
							<image :src="$fullUrl(form['liver_function'])" />
						</view>
						<uni-icons style="display: none;" class="forward" type="forward" id="form_img_liver_function"></uni-icons>
							</view>
							<view v-if="$check_field('set','renal_function') || $check_field('add','renal_function') || $check_field('get','renal_function')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								肾功能:
							</text>
						</view>
								<!-- 图片 -->
						<!-- 修改权限 -->
						<view class="diy_field diy_img diy_text_row" v-if="form['renal_function'] && $check_field('set','renal_function')">
							<image v-if="disabledObj['renal_function_isDisabled']" :src="$fullUrl(form['renal_function'])" />
							<image v-if="!disabledObj['renal_function_isDisabled']" :src="$fullUrl(form['renal_function'])" @click="change_img('renal_function')" />
						</view>
						<!-- 添加权限 -->
						<view class="diy_field diy_img diy_text_row" v-else-if="!form['renal_function'] && $check_field('add','renal_function')">
							<view v-if="disabledObj['renal_function_isDisabled']" class="btn_add_img">
								<text>+</text>
							</view>
							<view v-if="!disabledObj['renal_function_isDisabled']" class="btn_add_img diy_text_row" @click="change_img('renal_function')">
								<text>+</text>
							</view>
						</view>
						<!-- 查询权限 -->
						<view class="diy_field diy_img diy_text_row" v-else-if="$check_field('get','renal_function')">
							<image :src="$fullUrl(form['renal_function'])" />
						</view>
						<uni-icons style="display: none;" class="forward" type="forward" id="form_img_renal_function"></uni-icons>
							</view>
							<view v-if="$check_field('set','electrocardiogram') || $check_field('add','electrocardiogram') || $check_field('get','electrocardiogram')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								心电图:
							</text>
						</view>
								<!-- 图片 -->
						<!-- 修改权限 -->
						<view class="diy_field diy_img diy_text_row" v-if="form['electrocardiogram'] && $check_field('set','electrocardiogram')">
							<image v-if="disabledObj['electrocardiogram_isDisabled']" :src="$fullUrl(form['electrocardiogram'])" />
							<image v-if="!disabledObj['electrocardiogram_isDisabled']" :src="$fullUrl(form['electrocardiogram'])" @click="change_img('electrocardiogram')" />
						</view>
						<!-- 添加权限 -->
						<view class="diy_field diy_img diy_text_row" v-else-if="!form['electrocardiogram'] && $check_field('add','electrocardiogram')">
							<view v-if="disabledObj['electrocardiogram_isDisabled']" class="btn_add_img">
								<text>+</text>
							</view>
							<view v-if="!disabledObj['electrocardiogram_isDisabled']" class="btn_add_img diy_text_row" @click="change_img('electrocardiogram')">
								<text>+</text>
							</view>
						</view>
						<!-- 查询权限 -->
						<view class="diy_field diy_img diy_text_row" v-else-if="$check_field('get','electrocardiogram')">
							<image :src="$fullUrl(form['electrocardiogram'])" />
						</view>
						<uni-icons style="display: none;" class="forward" type="forward" id="form_img_electrocardiogram"></uni-icons>
							</view>
							<view v-if="$check_field('set','ultrasound_imaging') || $check_field('add','ultrasound_imaging') || $check_field('get','ultrasound_imaging')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								超声影像:
							</text>
						</view>
								<!-- 图片 -->
						<!-- 修改权限 -->
						<view class="diy_field diy_img diy_text_row" v-if="form['ultrasound_imaging'] && $check_field('set','ultrasound_imaging')">
							<image v-if="disabledObj['ultrasound_imaging_isDisabled']" :src="$fullUrl(form['ultrasound_imaging'])" />
							<image v-if="!disabledObj['ultrasound_imaging_isDisabled']" :src="$fullUrl(form['ultrasound_imaging'])" @click="change_img('ultrasound_imaging')" />
						</view>
						<!-- 添加权限 -->
						<view class="diy_field diy_img diy_text_row" v-else-if="!form['ultrasound_imaging'] && $check_field('add','ultrasound_imaging')">
							<view v-if="disabledObj['ultrasound_imaging_isDisabled']" class="btn_add_img">
								<text>+</text>
							</view>
							<view v-if="!disabledObj['ultrasound_imaging_isDisabled']" class="btn_add_img diy_text_row" @click="change_img('ultrasound_imaging')">
								<text>+</text>
							</view>
						</view>
						<!-- 查询权限 -->
						<view class="diy_field diy_img diy_text_row" v-else-if="$check_field('get','ultrasound_imaging')">
							<image :src="$fullUrl(form['ultrasound_imaging'])" />
						</view>
						<uni-icons style="display: none;" class="forward" type="forward" id="form_img_ultrasound_imaging"></uni-icons>
							</view>
							<view v-if="$check_field('set','ct_examination') || $check_field('add','ct_examination') || $check_field('get','ct_examination')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								CT检查:
							</text>
						</view>
								<!-- 图片 -->
						<!-- 修改权限 -->
						<view class="diy_field diy_img diy_text_row" v-if="form['ct_examination'] && $check_field('set','ct_examination')">
							<image v-if="disabledObj['ct_examination_isDisabled']" :src="$fullUrl(form['ct_examination'])" />
							<image v-if="!disabledObj['ct_examination_isDisabled']" :src="$fullUrl(form['ct_examination'])" @click="change_img('ct_examination')" />
						</view>
						<!-- 添加权限 -->
						<view class="diy_field diy_img diy_text_row" v-else-if="!form['ct_examination'] && $check_field('add','ct_examination')">
							<view v-if="disabledObj['ct_examination_isDisabled']" class="btn_add_img">
								<text>+</text>
							</view>
							<view v-if="!disabledObj['ct_examination_isDisabled']" class="btn_add_img diy_text_row" @click="change_img('ct_examination')">
								<text>+</text>
							</view>
						</view>
						<!-- 查询权限 -->
						<view class="diy_field diy_img diy_text_row" v-else-if="$check_field('get','ct_examination')">
							<image :src="$fullUrl(form['ct_examination'])" />
						</view>
						<uni-icons style="display: none;" class="forward" type="forward" id="form_img_ct_examination"></uni-icons>
							</view>
							<view v-if="$check_field('set','other_inspections') || $check_field('add','other_inspections') || $check_field('get','other_inspections')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								其他检查:
							</text>
						</view>
								<!-- 多文本 -->
						<view class="diy_field diy_desc diy_text_row">
							<textarea id="form_other_inspections" v-model="form['other_inspections']" v-if="(form['other_inspections'] && $check_field('set','other_inspections')) || (!form['other_inspections'] && $check_field('add','other_inspections'))" :disabled="disabledObj['other_inspections_isDisabled']"/>
							<text v-else-if="$check_field('get','other_inspections')">{{ form['other_inspections'] }}</text>
						</view>
							</view>
	
				</view>
				<view class="row">
					<view class="col-12">
						<view class="btn_box">
							<button class="btn_submit primary_btn" @click="submit()">提交</button>
						</view>
					</view>
				</view>
			</view>
		</view>
	</view>
</template>

<script>
import mixin from "@/libs/mixins/page.js";
export default {
	mixins:[mixin],
	components:{},
	data(){
		return{
			url_get_obj:"~/api/health_records/get_obj?",
			url_add:"~/api/health_records/add?",
			url_set:"~/api/health_records/set?",

			// 登录权限
			oauth: {
				"signIn": true,
				"user_group": []
			},

			// 查询条件
			query: {
					"member_account": 0,
						"member_name": "",
						"member_gender": "",
						"report_name": "",
						"physical_examination_time": "",
						"height_cm": "",
						"body_weightkg": "",
						"blood_pressure_data": "",
						"routine_blood_test": "",
						"urinalysis": "",
						"liver_function": "",
						"renal_function": "",
						"electrocardiogram": "",
						"ultrasound_imaging": "",
						"ct_examination": "",
						"other_inspections": "",
					"health_records_id": 0
			},

			obj: {
					"member_account": 0, // 会员账号
						"member_name":  '', // 会员姓名
						"member_gender":  '', // 会员性别
						"report_name":  '', // 报告名称
						"physical_examination_time": this.$toTime(new Date().getTime(), "yyyy-MM-dd"),
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
					"health_records_id": 0,

			},

			// 表单字段
			form: {
					"member_account": 0, // 会员账号
						"member_name":  '', // 会员姓名
						"member_gender":  '', // 会员性别
						"report_name":  '', // 报告名称
						"physical_examination_time": this.$toTime(new Date().getTime(), "yyyy-MM-dd"),
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
					"health_records_id": 0,
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
																															
			field:"health_records_id",
			table_key:"health_records",

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
				json.result.list.map((o) => this.list_user_member_account.push({value:o.user_id,text:o.nickname + '-' + o.username}));
			}
			else if(json.error){
				console.error(json.error);
			}
		},
		
	
				
	
				
	
				
	
				
	
				
	
				
	
				
	
				
	
				
	
				
	
				
	
				
	
				
	
				
	
				
	
			change_file(key_name){
			var _self = this;
				this.$chooseFile().then(res=>{
					console.log(res)

						const uploadTask = uni.uploadFile({
							url: _self.$fullUrl("/api/feedback/upload?"),
							filePath: res[0].path,
							name: "file",
							formData: {
								i_want_to_customize: "test",
							},
							header: {
								"x-auth-token": _self.$store.state.user.token,
							},
							success: function(uploadFileRes) {
								console.log(uploadFileRes)
								var filename = JSON.parse(uploadFileRes.data).result.url;
								_self.form[key_name] = filename;
							},
						});

						uploadTask.onProgressUpdate(function(res) {
							_self.percent = res.progress;
							console.log("上传进度" + res.progress);
							console.log("已经上传的数据长度" + res.totalBytesSent);
							console.log(
								"预期需要上传的数据总长度" + res.totalBytesExpectedToSend
							);
						});

				})
		},
		change_img(key_name) {
			var _self = this;
			_self.upload_img_flag = false
			// 选择图像方法
			uni.chooseImage({
				count: 1,
				sizeType: ['original', 'compressed'], //可以指定是原图还是压缩图，默认二者都有
				sourceType: ['album'], //从相册选择
				success: function(res) {
					const tempFilePaths = res.tempFilePaths;
					const uploadTask = uni.uploadFile({
						url: _self.$fullUrl('/api/health_records/upload?'),
						filePath: tempFilePaths[0],
						name: 'file',
						formData: {
							'health_records': 'test'
						},
						header: {
							'x-auth-token': _self.$store.state.user.token
						},
						success: function(uploadFileRes) {
							var filename = JSON.parse(uploadFileRes.data).result.url
							var img_url = filename
							_self.form[key_name] = img_url
						}
					});

					uploadTask.onProgressUpdate(function(res) {
						_self.percent = res.progress;
						console.log('上传进度' + res.progress);
						console.log('已经上传的数据长度' + res.totalBytesSent);
						console.log('预期需要上传的数据总长度' + res.totalBytesExpectedToSend);
					});
				},
				error: function(e) {
					console.log(e);
				}
			});
		},

		/**
		 * 获取对象后获取缓存表单
		 * @param {Object} json
		 * @param {Object} func
		 */
		get_obj_before(param){
			var form = uni.db.get("form");
			if (form) {
        delete(form.examine_state)
        delete(form.examine_reply)
				this.obj = uni.push(this.obj ,form);
				this.form = uni.push(this.form ,form);
			}
			var arr = []
			for (let key in form) {
				arr.push(key)
			}
			for (var i=0;i<arr.length;i++){
				this.disabledObj[arr[i] + '_isDisabled'] = true
			}
													if (this.form["physical_examination_time"] && JSON.stringify(this.form["physical_examination_time"]).indexOf("-")===-1) {
				this.form["physical_examination_time"] = this.$toTime(parseInt(this.form["physical_examination_time"]), "yyyy-MM-dd")
			}
																										uni.db.del("form");
			return param;
		},

		/**
		 * 获取对象后获取缓存表单
		 * @param {Object} json
		 * @param {Object} func
		 */
		get_obj_after(json ,func){
			var form = uni.db.get("form");
			var obj = Object.assign({} ,form ,this.obj);
			if (form) {
				this.obj = uni.push(this.obj ,obj);
			}
			if (form) {
				this.form = uni.push(this.form ,form);
			}
			if(func){
				func(json);
			}
		},

	},
	onLoad(){
					this.get_list_user_member_account();
																																															},
}
</script>

<style scoped>
	input{
		font-size: 10px;
	}

	.form_edit {
		background-color: #fff;
		margin-bottom: 0.5rem;
		padding: 1rem;
		font-size: 10px;
	}

	.item {
		display: flex;
		padding: 0.2rem 0;
	}

	.left_text {
		flex: 0 0 25%;
		display: flex;
		align-items: center;
	}

	.right_text {
		flex: 0 0 75%;
		border-bottom: 1px solid #eee;
	}
	.right_text.btn_warp{
		border-bottom: 0;
	}

	.btn_submit {
		text-align: center;
		background-color: #fff;
		padding: 0.3rem;
		margin: 0.1rem 1rem;
		border: 1px solid #eee;
		border-radius: 0.5rem;
	}

	.btn_submit:hover {
		opacity: 0.5;
	}
	.btn_add_img{
		color: #D3D3D3;
		text-align: center;
		border: 1px solid #eee;
		height: 5rem;
		width: 5rem;
		position: relative;
	}
	.btn_add_img text{
		font-size: 35px;
		position: absolute;
		left: 50%;
		top: 50%;
		transform: translate(-50%,-50%);
	}




</style>
<style scoped>
/*新样式*/
.diy_text_row {
  display: inline-block;
}
.container {
	margin-top:1rem ;
	padding: 1rem;
    -webkit-box-shadow: 0px 0px 0px #888888;
    box-shadow: 0px 0px 0px #888888;
}
.primary_btn{
		background-color: #22B8B8;
		color: #FFFFFF;
	}
	.btn_submit{
		padding: 0;
		margin-top:1rem ;
	}
	.row-item {
		padding: 10px 10px;
	    background: #f8f6fc;
		margin-bottom: 1rem;
	}
	.diy_field{
		padding-left: 1rem;
	}
	.diy_title{
		align-items: center;
        font-size: 14px;
        color: #333;
	}

	.row-item{
		display: flex !important;
		align-items: baseline;
	}
	.diy_select_flex{
		flex: 1;
	}
	.query_select{
		flex: 1;
		border-color: rgb(229, 229, 229);
		background-color: rgb(255, 255, 255);
		border-radius: 4px;
		box-sizing: border-box;
		flex: 1;
		width: 100%;
		line-height: 2;
		font-size: 14px;
		height: 2.4em;
		min-height: 2.4em;
		display: block;
		outline:none;
	}
</style>

