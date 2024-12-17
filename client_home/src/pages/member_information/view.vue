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
                  v-if="user_group === '管理员' || (form['member_information_id'] && $check_field('set','member_account')) || (!form['member_information_id'] && $check_field('add','member_account'))"
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
                            <uni-easyinput type="text" v-model="form['member_name']" v-if="user_group === '管理员' || (form['member_information_id'] && $check_field('set','member_name')) || (!form['member_information_id'] && $check_field('add','member_name'))" :disabled="disabledObj['member_name_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','member_name')">
                  {{ form['member_name'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','member_gender') || ($check_field('add','member_gender') || $check_field('set','member_gender'))" label="会员性别" name="member_gender">
                            <uni-easyinput type="text" v-model="form['member_gender']" v-if="user_group === '管理员' || (form['member_information_id'] && $check_field('set','member_gender')) || (!form['member_information_id'] && $check_field('add','member_gender'))" :disabled="disabledObj['member_gender_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','member_gender')">
                  {{ form['member_gender'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','last_physical_examination') || ($check_field('add','last_physical_examination') || $check_field('set','last_physical_examination'))" label="上次体检" name="last_physical_examination">
                    <uni-datetime-picker v-if="user_group === '管理员' || (form['member_information_id'] && $check_field('set','last_physical_examination')) || (!form['member_information_id'] && $check_field('add','last_physical_examination'))" v-model="form['last_physical_examination']" type="date" :disabled="disabledObj['last_physical_examination_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','last_physical_examination')">
                  {{ form['last_physical_examination'] }}
                </text>
                  </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','identification_number') || ($check_field('add','identification_number') || $check_field('set','identification_number'))" label="证件号码" name="identification_number">
                            <uni-easyinput type="text" v-model="form['identification_number']" v-if="user_group === '管理员' || (form['member_information_id'] && $check_field('set','identification_number')) || (!form['member_information_id'] && $check_field('add','identification_number'))" :disabled="disabledObj['identification_number_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','identification_number')">
                  {{ form['identification_number'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','contact_information') || ($check_field('add','contact_information') || $check_field('set','contact_information'))" label="联系方式" name="contact_information">
                            <uni-easyinput type="text" v-model="form['contact_information']" v-if="user_group === '管理员' || (form['member_information_id'] && $check_field('set','contact_information')) || (!form['member_information_id'] && $check_field('add','contact_information'))" :disabled="disabledObj['contact_information_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','contact_information')">
                  {{ form['contact_information'] }}
                </text>
                          </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','residential_address') || ($check_field('add','residential_address') || $check_field('set','residential_address'))" label="居住地址" name="residential_address">
                    <uni-easyinput type="textarea" v-model="form['residential_address']" v-if="user_group === '管理员' || (form['member_information_id'] && $check_field('set','residential_address')) || (!form['member_information_id'] && $check_field('add','residential_address'))" :disabled="disabledObj['residential_address_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','residential_address')">
                  {{ form['residential_address'] }}
                </text>
                  </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','member_notes') || ($check_field('add','member_notes') || $check_field('set','member_notes'))" label="会员备注" name="member_notes">
                    <uni-easyinput type="textarea" v-model="form['member_notes']" v-if="user_group === '管理员' || (form['member_information_id'] && $check_field('set','member_notes')) || (!form['member_information_id'] && $check_field('add','member_notes'))" :disabled="disabledObj['member_notes_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','member_notes')">
                  {{ form['member_notes'] }}
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
                    "last_physical_examination": this.$toTime(new Date().getTime(), "yyyy-MM-dd"),
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
            url: _self.$fullUrl('/api/member_information/upload?'),
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
            url: _self.$fullUrl('/api/member_information/upload?'),
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
                                      if (this.form["last_physical_examination"] && JSON.stringify(this.form["last_physical_examination"]).indexOf("-")===-1) {
        this.form["last_physical_examination"] = this.$toTime(parseInt(this.form["last_physical_examination"]), "yyyy-MM-dd")
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
                                      if (this.form["last_physical_examination"] && JSON.stringify(this.form["last_physical_examination"]).indexOf("-")===-1) {
        this.form["last_physical_examination"] = this.$toTime(parseInt(this.form["last_physical_examination"]),"yyyy-MM-dd")
      }
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
