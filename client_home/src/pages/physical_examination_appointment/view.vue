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
                  v-if="user_group === '管理员' || (form['physical_examination_appointment_id'] && $check_field('set','member_account')) || (!form['physical_examination_appointment_id'] && $check_field('add','member_account'))"
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
                            <uni-easyinput type="text" v-model="form['member_name']" v-if="user_group === '管理员' || (form['physical_examination_appointment_id'] && $check_field('set','member_name')) || (!form['physical_examination_appointment_id'] && $check_field('add','member_name'))" :disabled="disabledObj['member_name_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','member_name')">
                  {{ form['member_name'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','member_gender') || ($check_field('add','member_gender') || $check_field('set','member_gender'))" label="会员性别" name="member_gender">
                            <uni-easyinput type="text" v-model="form['member_gender']" v-if="user_group === '管理员' || (form['physical_examination_appointment_id'] && $check_field('set','member_gender')) || (!form['physical_examination_appointment_id'] && $check_field('add','member_gender'))" :disabled="disabledObj['member_gender_isDisabled']" />
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
                  v-if="user_group === '管理员' || (form['physical_examination_appointment_id'] && $check_field('set','doctor_account')) || (!form['physical_examination_appointment_id'] && $check_field('add','doctor_account'))"
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
                            <uni-easyinput type="text" v-model="form['doctor_no']" v-if="user_group === '管理员' || (form['physical_examination_appointment_id'] && $check_field('set','doctor_no')) || (!form['physical_examination_appointment_id'] && $check_field('add','doctor_no'))" :disabled="disabledObj['doctor_no_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','doctor_no')">
                  {{ form['doctor_no'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','doctors_name') || ($check_field('add','doctors_name') || $check_field('set','doctors_name'))" label="医生姓名" name="doctors_name">
                            <uni-easyinput type="text" v-model="form['doctors_name']" v-if="user_group === '管理员' || (form['physical_examination_appointment_id'] && $check_field('set','doctors_name')) || (!form['physical_examination_appointment_id'] && $check_field('add','doctors_name'))" :disabled="disabledObj['doctors_name_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','doctors_name')">
                  {{ form['doctors_name'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','time_of_appointment') || ($check_field('add','time_of_appointment') || $check_field('set','time_of_appointment'))" label="预约时间" name="time_of_appointment">
                    <uni-datetime-picker v-if="user_group === '管理员' || (form['physical_examination_appointment_id'] && $check_field('set','time_of_appointment')) || (!form['physical_examination_appointment_id'] && $check_field('add','time_of_appointment'))" @change="changeLog($event,'time_of_appointment')" v-model="form['time_of_appointment']" type="datetime" :disabled="disabledObj['time_of_appointment_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','time_of_appointment')">
                  {{ form['time_of_appointment'] }}
                </text>
                  </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','contact_information') || ($check_field('add','contact_information') || $check_field('set','contact_information'))" label="联系方式" name="contact_information">
                            <uni-easyinput type="text" v-model="form['contact_information']" v-if="user_group === '管理员' || (form['physical_examination_appointment_id'] && $check_field('set','contact_information')) || (!form['physical_examination_appointment_id'] && $check_field('add','contact_information'))" :disabled="disabledObj['contact_information_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','contact_information')">
                  {{ form['contact_information'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','remarks') || ($check_field('add','remarks') || $check_field('set','remarks'))" label="备注" name="remarks">
                    <uni-easyinput type="textarea" v-model="form['remarks']" v-if="user_group === '管理员' || (form['physical_examination_appointment_id'] && $check_field('set','remarks')) || (!form['physical_examination_appointment_id'] && $check_field('add','remarks'))" :disabled="disabledObj['remarks_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','remarks')">
                  {{ form['remarks'] }}
                </text>
                  </uni-forms-item>
              <uni-forms-item label="审核状态" name="examine_state">
                <uni-data-select
                    v-model="form['examine_state']"
                    :localdata="list_examine_state"
                    v-if="user_group === '管理员' || (form['examine_state'] && $check_examine()) || (!form['examine_state'] && $check_examine())"
                ></uni-data-select>
                <text v-else>{{form["examine_state"]}}</text>
              </uni-forms-item>
              <uni-forms-item label="审核回复" name="examine_reply">
                <uni-easyinput type="text" placeholder="请输入审核回复" v-model="form['examine_reply']"
                               v-if="user_group === '管理员' || (form['examine_reply'] && $check_examine()) || (!form['examine_reply'] && $check_examine())" />
                <!-- 仅查看 -->
                <text v-else>{{form["examine_reply"]}}</text>
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
      field: "physical_examination_appointment_id",
      url_add: "~/api/physical_examination_appointment/add?",
      url_set: "~/api/physical_examination_appointment/set?",
      url_get_obj: "~/api/physical_examination_appointment/get_obj?",
      url_upload: "~/api/physical_examination_appointment/upload?",

      query: {
        "physical_examination_appointment_id": 0,
      },

      form: {
            "member_account": 0, // 会员账号
                    "member_name":  '', // 会员姓名
                    "member_gender":  '', // 会员性别
                    "doctor_account": 0, // 医生账号
                    "doctor_no":  '', // 医生编号
                    "doctors_name":  '', // 医生姓名
                    "time_of_appointment": this.$toTime(new Date().getTime(), "yyyy-MM-dd hh:mm:ss"),
                    "contact_information":  '', // 联系方式
                    "remarks":  '', // 备注
                        "examine_state": "未审核",
                    "examine_reply": "",
                    "physical_examination_appointment_id": 0, // ID
                
              },
          disabledObj:{
                        "member_account_isDisabled": false,
                                "member_name_isDisabled": false,
                                "member_gender_isDisabled": false,
                                "doctor_account_isDisabled": false,
                                "doctor_no_isDisabled": false,
                                "doctors_name_isDisabled": false,
                                "time_of_appointment_isDisabled": false,
                                "contact_information_isDisabled": false,
                                "remarks_isDisabled": false,
                                  },
                                // 用户列表
            list_user_member_account: [],
                        // 用户组
            group_user_member_account: "",
                                                                                            // 用户列表
            list_user_doctor_account: [],
                                                                                                                                          list_examine_state:[{value:"未审核",text:"未审核"},{value:"已通过",text:"已通过"},{value:"未通过",text:"未通过"}],
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
            url: _self.$fullUrl('/api/physical_examination_appointment/upload?'),
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
            url: _self.$fullUrl('/api/physical_examination_appointment/upload?'),
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
                                                          if (this.form["time_of_appointment"] && JSON.stringify(this.form["time_of_appointment"]).indexOf("-")===-1) {
        this.form["time_of_appointment"] = this.$toTime(parseInt(this.form["time_of_appointment"]), "yyyy-MM-dd hh:mm:ss")
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
     * 获取会员用户用户组
     */
    async get_group_user_member_account() {
      this.form["member_account"] = this.user.user_id;
      var json = await this.$get("~/api/user_group/get_obj?name=会员用户");
      if(json.result && json.result.obj){
        this.group_user_member_account = json.result.obj;
        this.get_user_session_member_account(this.form['member_account'])
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
     * 获取对象之后
     * @param {Object} json
     * @param {Object} func
     */
    get_obj_after(json, func){
                                                          if (this.form["time_of_appointment"] && JSON.stringify(this.form["time_of_appointment"]).indexOf("-")===-1) {
        this.form["time_of_appointment"] = this.$toTime(parseInt(this.form["time_of_appointment"]), "yyyy-MM-dd hh:mm:ss")
      }
                            },

    is_view(){
      var bl = this.user_group == "管理员";

      if(!bl){
        bl = this.$check_action('/physical_examination_appointment/table','add');
        console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
      }
      if(!bl){
        bl = this.$check_action('/physical_examination_appointment/table','set');
        console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
      }
      if(!bl){
        bl = this.$check_action('/physical_examination_appointment/view','add');
        console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
      }
      if(!bl){
        bl = this.$check_action('/physical_examination_appointment/view','set');
        console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
      }
      if(!bl){
        bl = this.$check_action('/physical_examination_appointment/view','get');
        console.log(bl ? "你有视图查询权限视作有查询权限" : "你没有视图查询权限");
      }

      console.log(bl ? "具有当前页面的查看权，请注意这不代表你有字段的查看权" : "无权查看当前页，请注意即便有字段查询权限没有页面查询权限也不行");

      return bl;
    },

  },
  created() {
            this.get_list_user_member_account();
            this.get_group_user_member_account();
                                        this.get_list_user_doctor_account();
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
