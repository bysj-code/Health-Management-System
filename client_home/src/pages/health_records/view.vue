<template>
  <view>
    <view class="container diy_view">
      <view>
        <view>
          <view class="">
            <uni-forms :modelValue="form"  v-if="is_view()">

              <uni-forms-item v-if="$check_field('get','member_account') || ($check_field('add','member_account') || $check_field('set','member_account'))" label="会员账号" name="member_account">
                    <uni-data-select
                  id="form_member_account"
                  v-model="form['member_account']"
                  :localdata="list_user_member_account"
                  :clear="!disabledObj['member_account_isDisabled']"
                  :disabled="disabledObj['member_account_isDisabled']"
                  v-if="user_group === '管理员' || (form['health_records_id'] && $check_field('set','member_account')) || (!form['health_records_id'] && $check_field('add','member_account'))"
                ></uni-data-select>
                <uni-data-select
                  v-model="form['member_account']"
                  :localdata="list_user_member_account"
                  :clear="false"
                  :disabled="true"
                  v-else-if="$check_field('get','member_account')" id="member_account"
                ></uni-data-select>
                  </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','member_name') || ($check_field('add','member_name') || $check_field('set','member_name'))" label="会员姓名" name="member_name">
                            <uni-easyinput type="text" v-model="form['member_name']" v-if="user_group === '管理员' || (form['health_records_id'] && $check_field('set','member_name')) || (!form['health_records_id'] && $check_field('add','member_name'))" :disabled="disabledObj['member_name_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','member_name')">
                  {{ form['member_name'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','member_gender') || ($check_field('add','member_gender') || $check_field('set','member_gender'))" label="会员性别" name="member_gender">
                            <uni-easyinput type="text" v-model="form['member_gender']" v-if="user_group === '管理员' || (form['health_records_id'] && $check_field('set','member_gender')) || (!form['health_records_id'] && $check_field('add','member_gender'))" :disabled="disabledObj['member_gender_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','member_gender')">
                  {{ form['member_gender'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','report_name') || ($check_field('add','report_name') || $check_field('set','report_name'))" label="报告名称" name="report_name">
                            <uni-easyinput type="text" v-model="form['report_name']" v-if="user_group === '管理员' || (form['health_records_id'] && $check_field('set','report_name')) || (!form['health_records_id'] && $check_field('add','report_name'))" :disabled="disabledObj['report_name_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','report_name')">
                  {{ form['report_name'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','physical_examination_time') || ($check_field('add','physical_examination_time') || $check_field('set','physical_examination_time'))" label="体检时间" name="physical_examination_time">
                    <uni-datetime-picker v-if="user_group === '管理员' || (form['health_records_id'] && $check_field('set','physical_examination_time')) || (!form['health_records_id'] && $check_field('add','physical_examination_time'))" v-model="form['physical_examination_time']" type="date" :disabled="disabledObj['physical_examination_time_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','physical_examination_time')">
                  {{ form['physical_examination_time'] }}
                </text>
                  </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','height_cm') || ($check_field('add','height_cm') || $check_field('set','height_cm'))" label="身高/cm" name="height_cm">
                            <uni-easyinput type="text" v-model="form['height_cm']" v-if="user_group === '管理员' || (form['health_records_id'] && $check_field('set','height_cm')) || (!form['health_records_id'] && $check_field('add','height_cm'))" :disabled="disabledObj['height_cm_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','height_cm')">
                  {{ form['height_cm'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','body_weightkg') || ($check_field('add','body_weightkg') || $check_field('set','body_weightkg'))" label="体重/kg" name="body_weightkg">
                            <uni-easyinput type="text" v-model="form['body_weightkg']" v-if="user_group === '管理员' || (form['health_records_id'] && $check_field('set','body_weightkg')) || (!form['health_records_id'] && $check_field('add','body_weightkg'))" :disabled="disabledObj['body_weightkg_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','body_weightkg')">
                  {{ form['body_weightkg'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','blood_pressure_data') || ($check_field('add','blood_pressure_data') || $check_field('set','blood_pressure_data'))" label="血压数据" name="blood_pressure_data">
                            <uni-easyinput type="text" v-model="form['blood_pressure_data']" v-if="user_group === '管理员' || (form['health_records_id'] && $check_field('set','blood_pressure_data')) || (!form['health_records_id'] && $check_field('add','blood_pressure_data'))" :disabled="disabledObj['blood_pressure_data_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','blood_pressure_data')">
                  {{ form['blood_pressure_data'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','routine_blood_test') || ($check_field('add','routine_blood_test') || $check_field('set','routine_blood_test'))" label="血常规" name="routine_blood_test">
                    <!-- 修改权限 -->
                <view class="diy_field diy_img" v-if="form['routine_blood_test'] && $check_field('set','routine_blood_test')">
                  <image v-if="disabledObj['routine_blood_test_isDisabled']" :src="$fullUrl(form['routine_blood_test'])" />
                  <image v-if="!disabledObj['routine_blood_test_isDisabled']" :src="$fullUrl(form['routine_blood_test'])" @click="change_img('routine_blood_test')" />
                </view>
                <!-- 添加权限 -->
                <view class="diy_field diy_img" v-else-if="!form['routine_blood_test'] && $check_field('add','routine_blood_test')">
                  <view v-if="disabledObj['routine_blood_test_isDisabled']" class="btn_add_img">
                    <text>+</text>
                  </view>
                  <view v-if="!disabledObj['routine_blood_test_isDisabled']" class="btn_add_img" @click="change_img('routine_blood_test')">
                    <text>+</text>
                  </view>
                </view>
                <!-- 查询权限 -->
                <view class="diy_field diy_img" v-else-if="$check_field('get','routine_blood_test')">
                  <image :src="$fullUrl(form['routine_blood_test'])" />
                </view>
                  </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','urinalysis') || ($check_field('add','urinalysis') || $check_field('set','urinalysis'))" label="尿常规" name="urinalysis">
                    <!-- 修改权限 -->
                <view class="diy_field diy_img" v-if="form['urinalysis'] && $check_field('set','urinalysis')">
                  <image v-if="disabledObj['urinalysis_isDisabled']" :src="$fullUrl(form['urinalysis'])" />
                  <image v-if="!disabledObj['urinalysis_isDisabled']" :src="$fullUrl(form['urinalysis'])" @click="change_img('urinalysis')" />
                </view>
                <!-- 添加权限 -->
                <view class="diy_field diy_img" v-else-if="!form['urinalysis'] && $check_field('add','urinalysis')">
                  <view v-if="disabledObj['urinalysis_isDisabled']" class="btn_add_img">
                    <text>+</text>
                  </view>
                  <view v-if="!disabledObj['urinalysis_isDisabled']" class="btn_add_img" @click="change_img('urinalysis')">
                    <text>+</text>
                  </view>
                </view>
                <!-- 查询权限 -->
                <view class="diy_field diy_img" v-else-if="$check_field('get','urinalysis')">
                  <image :src="$fullUrl(form['urinalysis'])" />
                </view>
                  </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','liver_function') || ($check_field('add','liver_function') || $check_field('set','liver_function'))" label="肝功能" name="liver_function">
                    <!-- 修改权限 -->
                <view class="diy_field diy_img" v-if="form['liver_function'] && $check_field('set','liver_function')">
                  <image v-if="disabledObj['liver_function_isDisabled']" :src="$fullUrl(form['liver_function'])" />
                  <image v-if="!disabledObj['liver_function_isDisabled']" :src="$fullUrl(form['liver_function'])" @click="change_img('liver_function')" />
                </view>
                <!-- 添加权限 -->
                <view class="diy_field diy_img" v-else-if="!form['liver_function'] && $check_field('add','liver_function')">
                  <view v-if="disabledObj['liver_function_isDisabled']" class="btn_add_img">
                    <text>+</text>
                  </view>
                  <view v-if="!disabledObj['liver_function_isDisabled']" class="btn_add_img" @click="change_img('liver_function')">
                    <text>+</text>
                  </view>
                </view>
                <!-- 查询权限 -->
                <view class="diy_field diy_img" v-else-if="$check_field('get','liver_function')">
                  <image :src="$fullUrl(form['liver_function'])" />
                </view>
                  </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','renal_function') || ($check_field('add','renal_function') || $check_field('set','renal_function'))" label="肾功能" name="renal_function">
                    <!-- 修改权限 -->
                <view class="diy_field diy_img" v-if="form['renal_function'] && $check_field('set','renal_function')">
                  <image v-if="disabledObj['renal_function_isDisabled']" :src="$fullUrl(form['renal_function'])" />
                  <image v-if="!disabledObj['renal_function_isDisabled']" :src="$fullUrl(form['renal_function'])" @click="change_img('renal_function')" />
                </view>
                <!-- 添加权限 -->
                <view class="diy_field diy_img" v-else-if="!form['renal_function'] && $check_field('add','renal_function')">
                  <view v-if="disabledObj['renal_function_isDisabled']" class="btn_add_img">
                    <text>+</text>
                  </view>
                  <view v-if="!disabledObj['renal_function_isDisabled']" class="btn_add_img" @click="change_img('renal_function')">
                    <text>+</text>
                  </view>
                </view>
                <!-- 查询权限 -->
                <view class="diy_field diy_img" v-else-if="$check_field('get','renal_function')">
                  <image :src="$fullUrl(form['renal_function'])" />
                </view>
                  </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','electrocardiogram') || ($check_field('add','electrocardiogram') || $check_field('set','electrocardiogram'))" label="心电图" name="electrocardiogram">
                    <!-- 修改权限 -->
                <view class="diy_field diy_img" v-if="form['electrocardiogram'] && $check_field('set','electrocardiogram')">
                  <image v-if="disabledObj['electrocardiogram_isDisabled']" :src="$fullUrl(form['electrocardiogram'])" />
                  <image v-if="!disabledObj['electrocardiogram_isDisabled']" :src="$fullUrl(form['electrocardiogram'])" @click="change_img('electrocardiogram')" />
                </view>
                <!-- 添加权限 -->
                <view class="diy_field diy_img" v-else-if="!form['electrocardiogram'] && $check_field('add','electrocardiogram')">
                  <view v-if="disabledObj['electrocardiogram_isDisabled']" class="btn_add_img">
                    <text>+</text>
                  </view>
                  <view v-if="!disabledObj['electrocardiogram_isDisabled']" class="btn_add_img" @click="change_img('electrocardiogram')">
                    <text>+</text>
                  </view>
                </view>
                <!-- 查询权限 -->
                <view class="diy_field diy_img" v-else-if="$check_field('get','electrocardiogram')">
                  <image :src="$fullUrl(form['electrocardiogram'])" />
                </view>
                  </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','ultrasound_imaging') || ($check_field('add','ultrasound_imaging') || $check_field('set','ultrasound_imaging'))" label="超声影像" name="ultrasound_imaging">
                    <!-- 修改权限 -->
                <view class="diy_field diy_img" v-if="form['ultrasound_imaging'] && $check_field('set','ultrasound_imaging')">
                  <image v-if="disabledObj['ultrasound_imaging_isDisabled']" :src="$fullUrl(form['ultrasound_imaging'])" />
                  <image v-if="!disabledObj['ultrasound_imaging_isDisabled']" :src="$fullUrl(form['ultrasound_imaging'])" @click="change_img('ultrasound_imaging')" />
                </view>
                <!-- 添加权限 -->
                <view class="diy_field diy_img" v-else-if="!form['ultrasound_imaging'] && $check_field('add','ultrasound_imaging')">
                  <view v-if="disabledObj['ultrasound_imaging_isDisabled']" class="btn_add_img">
                    <text>+</text>
                  </view>
                  <view v-if="!disabledObj['ultrasound_imaging_isDisabled']" class="btn_add_img" @click="change_img('ultrasound_imaging')">
                    <text>+</text>
                  </view>
                </view>
                <!-- 查询权限 -->
                <view class="diy_field diy_img" v-else-if="$check_field('get','ultrasound_imaging')">
                  <image :src="$fullUrl(form['ultrasound_imaging'])" />
                </view>
                  </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','ct_examination') || ($check_field('add','ct_examination') || $check_field('set','ct_examination'))" label="CT检查" name="ct_examination">
                    <!-- 修改权限 -->
                <view class="diy_field diy_img" v-if="form['ct_examination'] && $check_field('set','ct_examination')">
                  <image v-if="disabledObj['ct_examination_isDisabled']" :src="$fullUrl(form['ct_examination'])" />
                  <image v-if="!disabledObj['ct_examination_isDisabled']" :src="$fullUrl(form['ct_examination'])" @click="change_img('ct_examination')" />
                </view>
                <!-- 添加权限 -->
                <view class="diy_field diy_img" v-else-if="!form['ct_examination'] && $check_field('add','ct_examination')">
                  <view v-if="disabledObj['ct_examination_isDisabled']" class="btn_add_img">
                    <text>+</text>
                  </view>
                  <view v-if="!disabledObj['ct_examination_isDisabled']" class="btn_add_img" @click="change_img('ct_examination')">
                    <text>+</text>
                  </view>
                </view>
                <!-- 查询权限 -->
                <view class="diy_field diy_img" v-else-if="$check_field('get','ct_examination')">
                  <image :src="$fullUrl(form['ct_examination'])" />
                </view>
                  </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','other_inspections') || ($check_field('add','other_inspections') || $check_field('set','other_inspections'))" label="其他检查" name="other_inspections">
                    <uni-easyinput type="textarea" v-model="form['other_inspections']" v-if="user_group === '管理员' || (form['health_records_id'] && $check_field('set','other_inspections')) || (!form['health_records_id'] && $check_field('add','other_inspections'))" :disabled="disabledObj['other_inspections_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','other_inspections')">
                  {{ form['other_inspections'] }}
                </text>
                  </uni-forms-item>


            </uni-forms>
            <view class="form_button">
              <button size="mini" type="primary" @click="submit()" class="primary_btn">提交</button>
              <button size="mini" @click="cancel()">取消</button>
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
    changeLog(v,value){
      this.form[value] = v
    },
    /**
     * 上传文件
     * @param {Object} param文件参数
     */
    change_file(key_name){
      var _self = this;
      // 选择图像方法
      uni.chooseFile({
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
              'i_want_to_customize': 'test'
            },
            header: {
              'x-auth-token': _self.$store.state.user.token
            },
            success: function(uploadFileRes) {
              var filename = JSON.parse(uploadFileRes.data).result.url
              _self.form[key_name] = filename
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
     * 上传图片
     * @param {Object} param文件参数
     */
    change_img(key_name){
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
              'i_want_to_customize': 'test'
            },
            header: {
              'x-auth-token': _self.$store.state.user.token
            },
            success: function(uploadFileRes) {
              var filename = JSON.parse(uploadFileRes.data).result.url
              _self.form[key_name] = filename
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
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
    
    /**
     * 获取对象之后
     * @param {Object} json
     * @param {Object} func
     */
    get_obj_after(json, func){
                                              if (this.form["physical_examination_time"] && JSON.stringify(this.form["physical_examination_time"]).indexOf("-")===-1) {
        this.form["physical_examination_time"] = this.$toTime(parseInt(this.form["physical_examination_time"]),"yyyy-MM-dd")
      }
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

  },
  created() {
            this.get_list_user_member_account();
                                                                                                                                      },
}
</script>

<style scoped>
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

.form_button{
  padding-bottom: 15px;
  display: flex;
}
.form_button button{
  width: 40%;
}
.query_select{
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

.query_option{
  width: 100%;
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
.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}

.avatar-uploader .el-upload:hover {
  border-color: #409eff;
}

.form_button {
  padding-bottom: 15px;
  display: flex;
}
.form_button button {
  width: 40%;
}
.query_select {
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
  outline: none;
}

.query_option {
  width: 100%;
}

.btn_add_img {
  color: #d3d3d3;
  text-align: center;
  border: 1px solid #eee;
  height: 5rem;
  width: 5rem;
  position: relative;
}
.btn_add_img text {
  font-size: 35px;
  position: absolute;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
}
/*新样式*/
.uni-forms{
padding-top:1rem;
}
.uni-forms-item {
	padding: 6px 10px;
    background: #f8f6fc;
}
.uni-forms .is-input-border{
	border: 0;
}
.container{
	    -webkit-box-shadow: 0px 0px 0px #888888;
	    box-shadow: 0px 0px 0px #888888;
}
.form_button .primary_btn{
		background-color: #22B8B8;
		color: #FFFFFF;
	}
</style>
