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
                  v-if="user_group === '管理员' || (form['health_assessment_id'] && $check_field('set','member_account')) || (!form['health_assessment_id'] && $check_field('add','member_account'))"
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
                            <uni-easyinput type="text" v-model="form['member_name']" v-if="user_group === '管理员' || (form['health_assessment_id'] && $check_field('set','member_name')) || (!form['health_assessment_id'] && $check_field('add','member_name'))" :disabled="disabledObj['member_name_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','member_name')">
                  {{ form['member_name'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','member_gender') || ($check_field('add','member_gender') || $check_field('set','member_gender'))" label="会员性别" name="member_gender">
                            <uni-easyinput type="text" v-model="form['member_gender']" v-if="user_group === '管理员' || (form['health_assessment_id'] && $check_field('set','member_gender')) || (!form['health_assessment_id'] && $check_field('add','member_gender'))" :disabled="disabledObj['member_gender_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','member_gender')">
                  {{ form['member_gender'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','doctor_account') || ($check_field('add','doctor_account') || $check_field('set','doctor_account'))" label="医生账号" name="doctor_account">
                    <uni-data-select
                  id="form_doctor_account"
                  v-model="form['doctor_account']"
                  :localdata="list_user_doctor_account"
                  :clear="!disabledObj['doctor_account_isDisabled']"
                  :disabled="disabledObj['doctor_account_isDisabled']"
                  v-if="user_group === '管理员' || (form['health_assessment_id'] && $check_field('set','doctor_account')) || (!form['health_assessment_id'] && $check_field('add','doctor_account'))"
                ></uni-data-select>
                <uni-data-select
                  v-model="form['doctor_account']"
                  :localdata="list_user_doctor_account"
                  :clear="false"
                  :disabled="true"
                  v-else-if="$check_field('get','doctor_account')" id="doctor_account"
                ></uni-data-select>
                  </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','doctor_no') || ($check_field('add','doctor_no') || $check_field('set','doctor_no'))" label="医生编号" name="doctor_no">
                            <uni-easyinput type="text" v-model="form['doctor_no']" v-if="user_group === '管理员' || (form['health_assessment_id'] && $check_field('set','doctor_no')) || (!form['health_assessment_id'] && $check_field('add','doctor_no'))" :disabled="disabledObj['doctor_no_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','doctor_no')">
                  {{ form['doctor_no'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','doctors_name') || ($check_field('add','doctors_name') || $check_field('set','doctors_name'))" label="医生姓名" name="doctors_name">
                            <uni-easyinput type="text" v-model="form['doctors_name']" v-if="user_group === '管理员' || (form['health_assessment_id'] && $check_field('set','doctors_name')) || (!form['health_assessment_id'] && $check_field('add','doctors_name'))" :disabled="disabledObj['doctors_name_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','doctors_name')">
                  {{ form['doctors_name'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','report_name') || ($check_field('add','report_name') || $check_field('set','report_name'))" label="报告名称" name="report_name">
                            <uni-easyinput type="text" v-model="form['report_name']" v-if="user_group === '管理员' || (form['health_assessment_id'] && $check_field('set','report_name')) || (!form['health_assessment_id'] && $check_field('add','report_name'))" :disabled="disabledObj['report_name_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','report_name')">
                  {{ form['report_name'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','evaluation_date') || ($check_field('add','evaluation_date') || $check_field('set','evaluation_date'))" label="评估日期" name="evaluation_date">
                    <uni-datetime-picker v-if="user_group === '管理员' || (form['health_assessment_id'] && $check_field('set','evaluation_date')) || (!form['health_assessment_id'] && $check_field('add','evaluation_date'))" v-model="form['evaluation_date']" type="date" :disabled="disabledObj['evaluation_date_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','evaluation_date')">
                  {{ form['evaluation_date'] }}
                </text>
                  </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','physical_assessment') || ($check_field('add','physical_assessment') || $check_field('set','physical_assessment'))" label="体质评估" name="physical_assessment">
                    <uni-easyinput type="textarea" v-model="form['physical_assessment']" v-if="user_group === '管理员' || (form['health_assessment_id'] && $check_field('set','physical_assessment')) || (!form['health_assessment_id'] && $check_field('add','physical_assessment'))" :disabled="disabledObj['physical_assessment_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','physical_assessment')">
                  {{ form['physical_assessment'] }}
                </text>
                  </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','psychological_assessment') || ($check_field('add','psychological_assessment') || $check_field('set','psychological_assessment'))" label="心理评估" name="psychological_assessment">
                    <uni-easyinput type="textarea" v-model="form['psychological_assessment']" v-if="user_group === '管理员' || (form['health_assessment_id'] && $check_field('set','psychological_assessment')) || (!form['health_assessment_id'] && $check_field('add','psychological_assessment'))" :disabled="disabledObj['psychological_assessment_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','psychological_assessment')">
                  {{ form['psychological_assessment'] }}
                </text>
                  </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','doctors_advice') || ($check_field('add','doctors_advice') || $check_field('set','doctors_advice'))" label="医生建议" name="doctors_advice">
                    <uni-easyinput type="textarea" v-model="form['doctors_advice']" v-if="user_group === '管理员' || (form['health_assessment_id'] && $check_field('set','doctors_advice')) || (!form['health_assessment_id'] && $check_field('add','doctors_advice'))" :disabled="disabledObj['doctors_advice_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','doctors_advice')">
                  {{ form['doctors_advice'] }}
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
                    "evaluation_date": this.$toTime(new Date().getTime(), "yyyy-MM-dd"),
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
            url: _self.$fullUrl('/api/health_assessment/upload?'),
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
            url: _self.$fullUrl('/api/health_assessment/upload?'),
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
                                                                      if (this.form["evaluation_date"] && JSON.stringify(this.form["evaluation_date"]).indexOf("-")===-1) {
        this.form["evaluation_date"] = this.$toTime(parseInt(this.form["evaluation_date"]), "yyyy-MM-dd")
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
     * 获取医生用户用户列表
     */
    async get_list_user_doctor_account() {
      // if(this.user_group !== "管理员" && this.form["doctor_account"] === 0) {
      //     this.form["doctor_account"] = this.user.user_id;
      // }
      var json = await this.$get("~/api/user/get_list?user_group=医生用户");
      if(json.result && json.result.list){
        json.result.list.map((o) => this.list_user_doctor_account.push({value:o.user_id,text:o.nickname + '-' + o.username}));
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
        this.get_user_session_doctor_account(this.form['doctor_account'])
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
            
            
            
            
            
            
            
            
    
    /**
     * 获取对象之后
     * @param {Object} json
     * @param {Object} func
     */
    get_obj_after(json, func){
                                                                      if (this.form["evaluation_date"] && JSON.stringify(this.form["evaluation_date"]).indexOf("-")===-1) {
        this.form["evaluation_date"] = this.$toTime(parseInt(this.form["evaluation_date"]),"yyyy-MM-dd")
      }
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

  },
  created() {
            this.get_list_user_member_account();
                                        this.get_list_user_doctor_account();
            this.get_group_user_doctor_account();
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
