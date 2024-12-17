<template>
	<view class="diy_edit page_consultation_response" id="consultation_response_edit">
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
							<view v-if="$check_field('set','doctor_account') || $check_field('add','doctor_account') || $check_field('get','doctor_account')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								医生账号:
							</text>
						</view>
						<view class="diy_field diy_down diy_text_row diy_select_flex">
							<uni-data-select
									id="form_doctor_account"
									v-model="form['doctor_account']"
									:localdata="list_user_doctor_account"
									:clear="!disabledObj['doctor_account_isDisabled']"
									:disabled="disabledObj['doctor_account_isDisabled']"
									v-if="(form['doctor_account'] && $check_field('set','doctor_account')) || (!form['doctor_account'] && $check_field('add','doctor_account'))"
							></uni-data-select>
							<text v-else-if="$check_field('get','doctor_account')">{{ form['doctor_account'] }}</text>
						</view>
					</view>
							<view v-if="$check_field('set','doctor_no') || $check_field('add','doctor_no') || $check_field('get','doctor_no')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								医生编号:
							</text>
						</view>
								<!-- 文本 -->
									<view class="diy_field diy_text diy_text_row">
							<input type="text" id="form_doctor_no" v-model="form['doctor_no']" placeholder="请输入医生编号" v-if="(form['doctor_no'] && $check_field('set','doctor_no')) || (!form['doctor_no'] && $check_field('add','doctor_no'))" :disabled="disabledObj['doctor_no_isDisabled']" />
							<text v-else-if="$check_field('get','doctor_no')">{{ form['doctor_no'] }}</text>
						</view>
										</view>
							<view v-if="$check_field('set','doctors_name') || $check_field('add','doctors_name') || $check_field('get','doctors_name')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								医生姓名:
							</text>
						</view>
								<!-- 文本 -->
									<view class="diy_field diy_text diy_text_row">
							<input type="text" id="form_doctors_name" v-model="form['doctors_name']" placeholder="请输入医生姓名" v-if="(form['doctors_name'] && $check_field('set','doctors_name')) || (!form['doctors_name'] && $check_field('add','doctors_name'))" :disabled="disabledObj['doctors_name_isDisabled']" />
							<text v-else-if="$check_field('get','doctors_name')">{{ form['doctors_name'] }}</text>
						</view>
										</view>
							<view v-if="$check_field('set','consultation_topic') || $check_field('add','consultation_topic') || $check_field('get','consultation_topic')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								咨询主题:
							</text>
						</view>
								<!-- 文本 -->
									<view class="diy_field diy_text diy_text_row">
							<input type="text" id="form_consultation_topic" v-model="form['consultation_topic']" placeholder="请输入咨询主题" v-if="(form['consultation_topic'] && $check_field('set','consultation_topic')) || (!form['consultation_topic'] && $check_field('add','consultation_topic'))" :disabled="disabledObj['consultation_topic_isDisabled']" />
							<text v-else-if="$check_field('get','consultation_topic')">{{ form['consultation_topic'] }}</text>
						</view>
										</view>
							<view v-if="$check_field('set','content') || $check_field('add','content') || $check_field('get','content')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								内容:
							</text>
						</view>
								<!-- 多文本 -->
						<view class="diy_field diy_desc diy_text_row">
							<textarea id="form_content" v-model="form['content']" v-if="(form['content'] && $check_field('set','content')) || (!form['content'] && $check_field('add','content'))" :disabled="disabledObj['content_isDisabled']"/>
							<text v-else-if="$check_field('get','content')">{{ form['content'] }}</text>
						</view>
							</view>
							<view v-if="$check_field('set','reply_time') || $check_field('add','reply_time') || $check_field('get','reply_time')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								回复时间:
							</text>
						</view>
								<!-- 日长 -->
						<view class="diy_field diy_datetime diy_text_row">
							<uni-datetime-picker :disabled="disabledObj['reply_time_isDisabled']" type="datetime" id="form_reply_time" v-model="form['reply_time']" placeholder="请输入回复时间" v-if="(form['reply_time'] && $check_field('set','reply_time')) || (!form['reply_time'] && $check_field('add','reply_time'))" />
							<text v-else-if="$check_field('get','reply_time')">{{ form['reply_time'] }}</text>
						</view>
							</view>
							<view v-if="$check_field('set','reply') || $check_field('add','reply') || $check_field('get','reply')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								回复:
							</text>
						</view>
								<!-- 多文本 -->
						<view class="diy_field diy_desc diy_text_row">
							<textarea id="form_reply" v-model="form['reply']" v-if="(form['reply'] && $check_field('set','reply')) || (!form['reply'] && $check_field('add','reply'))" :disabled="disabledObj['reply_isDisabled']"/>
							<text v-else-if="$check_field('get','reply')">{{ form['reply'] }}</text>
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
			url_get_obj:"~/api/consultation_response/get_obj?",
			url_add:"~/api/consultation_response/add?",
			url_set:"~/api/consultation_response/set?",

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
						"doctor_account": 0,
						"doctor_no": "",
						"doctors_name": "",
						"consultation_topic": "",
						"content": "",
						"reply_time": "",
						"reply": "",
					"consultation_response_id": 0
			},

			obj: {
					"member_account": 0, // 会员账号
						"member_name":  '', // 会员姓名
						"member_gender":  '', // 会员性别
						"doctor_account": 0, // 医生账号
						"doctor_no":  '', // 医生编号
						"doctors_name":  '', // 医生姓名
						"consultation_topic":  '', // 咨询主题
						"content":  '', // 内容
						"reply_time": this.$toTime(new Date().getTime(), "yyyy-MM-dd hh:mm:ss"),
						"reply":  '', // 回复
					"consultation_response_id": 0,

			},

			// 表单字段
			form: {
					"member_account": 0, // 会员账号
						"member_name":  '', // 会员姓名
						"member_gender":  '', // 会员性别
						"doctor_account": 0, // 医生账号
						"doctor_no":  '', // 医生编号
						"doctors_name":  '', // 医生姓名
						"consultation_topic":  '', // 咨询主题
						"content":  '', // 内容
						"reply_time": this.$toTime(new Date().getTime(), "yyyy-MM-dd hh:mm:ss"),
						"reply":  '', // 回复
					"consultation_response_id": 0,
			},
			disabledObj:{
					"member_account_isDisabled": false,
						"member_name_isDisabled": false,
						"member_gender_isDisabled": false,
						"doctor_account_isDisabled": false,
						"doctor_no_isDisabled": false,
						"doctors_name_isDisabled": false,
						"consultation_topic_isDisabled": false,
						"content_isDisabled": false,
						"reply_time_isDisabled": false,
						"reply_isDisabled": false,
				},

					// 用户列表
			list_user_member_account: [],
										// 用户列表
			list_user_doctor_account: [],
													
			field:"consultation_response_id",
			table_key:"consultation_response",

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
				async get_user_session_member_account(){
			var _this = this;
			var json = await this.$get("~/api/user_group/get_obj?name=会员用户");
			if(json.result && json.result.obj){
				var source_table = json.result.obj.source_table;
				var user_id = _this.$store.state.user.user_id;
				if (user_id){
					var url = "~/api/"+source_table+"/get_obj?"
					this.$get(url, {"user_id":_this.$store.state.user.user_id}, function(res) {
						if (res.result && res.result.obj) {
							var arr = []
							for (let key in res.result.obj) {
								arr.push(key)
							}
							var arrForm = []
							for (let key in _this.form) {
								arrForm.push(key)
							}
							_this.form["member_account"] = user_id
							_this.disabledObj['member_account' + '_isDisabled'] = true
							for (var i=0;i<arr.length;i++){
                if (arr[i]!=='examine_state' && arr[i]!=='examine_reply') {
                  for (var j = 0; j < arrForm.length; j++) {
                    if (arr[i] === arrForm[j]) {
                      if (arr[i] !== "member_account") {
                        _this.form[arrForm[j]] = res.result.obj[arr[i]]
                        _this.disabledObj[arrForm[j] + '_isDisabled'] = true
                        break;
                      }
                    }
                  }
                }
							}
						}
					});
				}
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
						url: _self.$fullUrl('/api/consultation_response/upload?'),
						filePath: tempFilePaths[0],
						name: 'file',
						formData: {
							'consultation_response': 'test'
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
																				if (this.form["reply_time"] && JSON.stringify(this.form["reply_time"]).indexOf("-")===-1) {
				this.form["reply_time"] = this.$toTime(parseInt(this.form["reply_time"]), "yyyy-MM-dd hh:mm:ss")
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
				this.get_user_session_member_account();
				this.get_list_user_member_account();
												this.get_list_user_doctor_account();
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

