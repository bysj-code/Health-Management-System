<template>
  <view>
    <view class="container diy_view">
      <view>
        <view>
          <view class="">
            <uni-forms :modelValue="form"  v-if="is_view()">

              <uni-forms-item v-if="$check_field('get','doctor_account') || ($check_field('add','doctor_account') || $check_field('set','doctor_account'))" label="医生账号" name="doctor_account">
                    <uni-data-select
                  id="form_doctor_account"
                  v-model="form['doctor_account']"
                  :localdata="list_user_doctor_account"
                  :clear="!disabledObj['doctor_account_isDisabled']"
                  :disabled="disabledObj['doctor_account_isDisabled']"
                  v-if="user_group === '管理员' || (form['doctor_information_id'] && $check_field('set','doctor_account')) || (!form['doctor_information_id'] && $check_field('add','doctor_account'))"
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
                            <uni-easyinput type="text" v-model="form['doctor_no']" v-if="user_group === '管理员' || (form['doctor_information_id'] && $check_field('set','doctor_no')) || (!form['doctor_information_id'] && $check_field('add','doctor_no'))" :disabled="disabledObj['doctor_no_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','doctor_no')">
                  {{ form['doctor_no'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','doctors_name') || ($check_field('add','doctors_name') || $check_field('set','doctors_name'))" label="医生姓名" name="doctors_name">
                            <uni-easyinput type="text" v-model="form['doctors_name']" v-if="user_group === '管理员' || (form['doctor_information_id'] && $check_field('set','doctors_name')) || (!form['doctor_information_id'] && $check_field('add','doctors_name'))" :disabled="disabledObj['doctors_name_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','doctors_name')">
                  {{ form['doctors_name'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','doctors_photo') || ($check_field('add','doctors_photo') || $check_field('set','doctors_photo'))" label="医生照片" name="doctors_photo">
                    <!-- 修改权限 -->
                <view class="diy_field diy_img" v-if="form['doctors_photo'] && $check_field('set','doctors_photo')">
                  <image v-if="disabledObj['doctors_photo_isDisabled']" :src="$fullUrl(form['doctors_photo'])" />
                  <image v-if="!disabledObj['doctors_photo_isDisabled']" :src="$fullUrl(form['doctors_photo'])" @click="change_img('doctors_photo')" />
                </view>
                <!-- 添加权限 -->
                <view class="diy_field diy_img" v-else-if="!form['doctors_photo'] && $check_field('add','doctors_photo')">
                  <view v-if="disabledObj['doctors_photo_isDisabled']" class="btn_add_img">
                    <text>+</text>
                  </view>
                  <view v-if="!disabledObj['doctors_photo_isDisabled']" class="btn_add_img" @click="change_img('doctors_photo')">
                    <text>+</text>
                  </view>
                </view>
                <!-- 查询权限 -->
                <view class="diy_field diy_img" v-else-if="$check_field('get','doctors_photo')">
                  <image :src="$fullUrl(form['doctors_photo'])" />
                </view>
                  </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','doctors_gender') || ($check_field('add','doctors_gender') || $check_field('set','doctors_gender'))" label="医生性别" name="doctors_gender">
                            <uni-easyinput type="text" v-model="form['doctors_gender']" v-if="user_group === '管理员' || (form['doctor_information_id'] && $check_field('set','doctors_gender')) || (!form['doctor_information_id'] && $check_field('add','doctors_gender'))" :disabled="disabledObj['doctors_gender_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','doctors_gender')">
                  {{ form['doctors_gender'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','employment_time') || ($check_field('add','employment_time') || $check_field('set','employment_time'))" label="从业时间" name="employment_time">
                            <uni-easyinput type="text" v-model="form['employment_time']" v-if="user_group === '管理员' || (form['doctor_information_id'] && $check_field('set','employment_time')) || (!form['doctor_information_id'] && $check_field('add','employment_time'))" :disabled="disabledObj['employment_time_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','employment_time')">
                  {{ form['employment_time'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','doctor_introduction') || ($check_field('add','doctor_introduction') || $check_field('set','doctor_introduction'))" label="医生简介" name="doctor_introduction">
                    <uni-easyinput type="textarea" v-model="form['doctor_introduction']" v-if="user_group === '管理员' || (form['doctor_information_id'] && $check_field('set','doctor_introduction')) || (!form['doctor_information_id'] && $check_field('add','doctor_introduction'))" :disabled="disabledObj['doctor_introduction_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','doctor_introduction')">
                  {{ form['doctor_introduction'] }}
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
            url: _self.$fullUrl('/api/doctor_information/upload?'),
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
            url: _self.$fullUrl('/api/doctor_information/upload?'),
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
                                                              uni.db.del("form");
      return param;
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

  },
  created() {
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
