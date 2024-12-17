<template>
	<view class="list_health_records list_com--new" style="background-color: #fff;">
		<!-- 视图 -->
		<view class="health_records_block box_wrap" >
			<navigator class="item_health_records box_style" v-for="(o, i) in list"  :key="i" :url="'/pages/health_records/details?health_records_id=' + o['health_records_id']">
					<view class="view" v-if="0 && $check_index_field('get','member_account','/health_records/list')">
					<view class="title" v-if="true">
						<span>会员账号</span>
					</view>
							<view class="diy_field time" >
						<span>{{ get_user_member_account(o['member_account']) }}</span>
					</view>
						</view>
						<view class="view" v-if="1 && $check_index_field('get','member_name','/health_records/list')">
					<view class="title" v-if="true">
						<span>会员姓名</span>
					</view>
							<view class="diy_field text" >
						<span>{{ o["member_name"] }}</span>
					</view>
						</view>
						<view class="view" v-if="1 && $check_index_field('get','member_gender','/health_records/list')">
					<view class="title" v-if="true">
						<span>会员性别</span>
					</view>
							<view class="diy_field text" >
						<span>{{ o["member_gender"] }}</span>
					</view>
						</view>
						<view class="view" v-if="1 && $check_index_field('get','report_name','/health_records/list')">
					<view class="title" v-if="true">
						<span>报告名称</span>
					</view>
							<view class="diy_field text" >
						<span>{{ o["report_name"] }}</span>
					</view>
						</view>
						<view class="view" v-if="0 && $check_index_field('get','physical_examination_time','/health_records/list')">
					<view class="title" v-if="true">
						<span>体检时间</span>
					</view>
							<view class="diy_field time" >
						<span>{{ $toTime(o["physical_examination_time"] ,"yyyy-MM-dd") }}</span>
					</view>
						</view>
						<view class="view" v-if="0 && $check_index_field('get','height_cm','/health_records/list')">
					<view class="title" v-if="true">
						<span>身高/cm</span>
					</view>
							<view class="diy_field text" >
						<span>{{ o["height_cm"] }}</span>
					</view>
						</view>
						<view class="view" v-if="0 && $check_index_field('get','body_weightkg','/health_records/list')">
					<view class="title" v-if="true">
						<span>体重/kg</span>
					</view>
							<view class="diy_field text" >
						<span>{{ o["body_weightkg"] }}</span>
					</view>
						</view>
						<view class="view" v-if="0 && $check_index_field('get','blood_pressure_data','/health_records/list')">
					<view class="title" v-if="true">
						<span>血压数据</span>
					</view>
							<view class="diy_field text" >
						<span>{{ o["blood_pressure_data"] }}</span>
					</view>
						</view>
						<view class="view" v-if="0 && $check_index_field('get','routine_blood_test','/health_records/list')">
					<view class="title" v-if=" false">
						<span>血常规</span>
					</view>
							<view class="diy_field image" >
						<image style="width:100%;height: 5rem;" :src="$fullUrl(o['routine_blood_test']) || '/static/img/default.png'" mode="scaleToFill" />
					</view>
						</view>
						<view class="view" v-if="0 && $check_index_field('get','urinalysis','/health_records/list')">
					<view class="title" v-if=" false">
						<span>尿常规</span>
					</view>
							<view class="diy_field image" >
						<image style="width:100%;height: 5rem;" :src="$fullUrl(o['urinalysis']) || '/static/img/default.png'" mode="scaleToFill" />
					</view>
						</view>
						<view class="view" v-if="0 && $check_index_field('get','liver_function','/health_records/list')">
					<view class="title" v-if=" false">
						<span>肝功能</span>
					</view>
							<view class="diy_field image" >
						<image style="width:100%;height: 5rem;" :src="$fullUrl(o['liver_function']) || '/static/img/default.png'" mode="scaleToFill" />
					</view>
						</view>
						<view class="view" v-if="0 && $check_index_field('get','renal_function','/health_records/list')">
					<view class="title" v-if=" false">
						<span>肾功能</span>
					</view>
							<view class="diy_field image" >
						<image style="width:100%;height: 5rem;" :src="$fullUrl(o['renal_function']) || '/static/img/default.png'" mode="scaleToFill" />
					</view>
						</view>
						<view class="view" v-if="0 && $check_index_field('get','electrocardiogram','/health_records/list')">
					<view class="title" v-if=" false">
						<span>心电图</span>
					</view>
							<view class="diy_field image" >
						<image style="width:100%;height: 5rem;" :src="$fullUrl(o['electrocardiogram']) || '/static/img/default.png'" mode="scaleToFill" />
					</view>
						</view>
						<view class="view" v-if="0 && $check_index_field('get','ultrasound_imaging','/health_records/list')">
					<view class="title" v-if=" false">
						<span>超声影像</span>
					</view>
							<view class="diy_field image" >
						<image style="width:100%;height: 5rem;" :src="$fullUrl(o['ultrasound_imaging']) || '/static/img/default.png'" mode="scaleToFill" />
					</view>
						</view>
						<view class="view" v-if="0 && $check_index_field('get','ct_examination','/health_records/list')">
					<view class="title" v-if=" false">
						<span>CT检查</span>
					</view>
							<view class="diy_field image" >
						<image style="width:100%;height: 5rem;" :src="$fullUrl(o['ct_examination']) || '/static/img/default.png'" mode="scaleToFill" />
					</view>
						</view>
						<view class="view" v-if="0 && $check_index_field('get','other_inspections','/health_records/list')">
					<view class="title" v-if="true">
						<span>其他检查</span>
					</view>
							<view class="diy_field text" >
						<span>{{ o["other_inspections"] }}</span>
					</view>
						</view>
					<view class="bottom-view">
				</view>
				<view class="view">
					<view class="create_time_block diy_field number">
						<span>{{ $toTime(o["create_time"],"yyyy-MM-dd hh:mm:ss") }}</span>
					</view>
				</view>
			</navigator>
		</view>
		<!-- /视图 -->
	</view>
</template>

<script>
	export default {
		props: {
			list: {
				type: Array,
				default: function() {
					return [];
				}
			}
		},
		data() {
			return {
					// 用户列表
				list_user_member_account: [],
																			}
		},
		methods: {
			/**
			 *  跳转链接
			 *  @param {Object} id
			 */
			to_nav(id) {
				this.$nav('/pages/health_records/details?health_records_id=' + id)
			},
				/**
			 * 获取会员用户用户列表
			 */
			async get_list_user_member_account() {
				var json = await this.$get("~/api/user/get_list?user_group=会员用户");
				if(json.result && json.result.list){
					this.list_user_member_account = json.result.list;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
			get_user_member_account(id){
				let obj = this.list_user_member_account;
				let ret = "";
				for(let i=0;i<obj.length;i++){
					if(obj[i].user_id==id){
						ret = obj[i].nickname+"-"+obj[i].username;
					}
				}
				return ret;
			},
																		},
		created() {
				this.get_list_user_member_account();
																		}
	}
</script>

<style scoped>
	.list_health_records {
		/* padding: 0 1rem; */
		margin-bottom: 1rem;
	}

	.list_health_records .list_health_records_table {
		width: 100%;
		padding: 5px 0;
	}

	.list_health_records .list_health_records_table .btn_change_table {
		margin-left: auto;
		font-weight: bold;
		padding: 0.5rem 0;
		width: 100px;
		text-align: center;
		font-size: 0.875rem;
		border: 1px solid #CCCCCC;
		border-radius: 1rem;
		margin-bottom: 0.25rem;
	}

	.list_health_records .list_health_records_table .health_records_table_block .uni-table-td{
		padding: 8px;
	}

	.list_health_records .list_health_records_table .health_records_table_block .image {
		width: 10%;
	}

	.list_health_records .list_health_records_table .health_records_table_block .text {
		overflow: hidden;
		width: 30%;
		font-size: 0.5rem;
	}

	.list_health_records .list_health_records_table .health_records_table_block .hits {
		width: 12%;
		font-size: 0.5rem;
	}

	.list_health_records .list_health_records_table .health_records_table_block .praise {
		width: 12%;
		font-size: 0.5rem;
	}

	.list_health_records .list_health_records_table .health_records_table_block .create_time {
		width: 26%;
		font-size: 0.5rem;
	}
	.list_health_records .item_health_records {
		display: flex;
		justify-content: space-between;
		align-items: stretch;
		padding: 0.75rem 1rem;

	}
	.list_health_records .item_health_records+.item_health_records{
		border-top: 1px solid #dbdbdb;
	}
	.list_health_records .item_health_records .left>image {
		position: relative;
		top: 50%;
		transform: translate(0, -50%);
		border-radius: 0.5rem;
	}

	.list_health_records .item_health_records .right_block {
		width: calc(100% - 5rem);
		display: flex;
		flex-direction: column;
		justify-content: space-between;
	}

	.list_health_records .top {
		font-size: 0.9rem;
	}


	.list_health_records .time {
		font-size: 0.6rem;
		color: var(--color_grey)
	}

	.list_health_records .bottom {
		display: flex;
		justify-content: space-between;
		align-items: baseline;
		font-size: 0.5rem;
		color: var(--color_grey)
	}

	.list_health_records .see {
		margin-left: 1rem;
	}
	.box_wrap{
		padding: 0.75rem;
	}
	.box_style{
		margin-bottom: 0.75rem;
		padding: 0.375rem;
		display: inline-block !important;
		border: 0.075rem solid #ccc;
		border-radius: 0.375rem;
		overflow: hidden;
	}
	.box_style:nth-child(even){
		margin-left: 0.60rem;
	}
	.box_style:nth-child(even){
		margin-left: 0.60rem;
	}
	.bottom-view,.create_time_block{
		font-size: 12px;
		color: #666666;
	}
	.bottom-view view{
		display: inline-block;
	}
	.bottom-view span{
		margin-left: 5px;
		margin-right: 10px;
	}
/* new style start */
	.list_com--new .box_wrap{
		display: flex;
		flex-wrap: wrap;
		padding-left: 0 !important;
		padding-right: 0 !important;
		justify-content: space-between;
	}
	.list_com--new .box_style:nth-child(even) {
    	margin-left: 0 !important;
	}
    .list_com--new .box_wrap .box_style{
		display: inline-block !important;
		width: 48%;
		max-width: 48%;
		overflow: hidden;
		border-color: var(--color_primary);
		box-sizing: border-box;
		padding:8px!important;
    }
    .list_com--new .view{
        display: flex;
        overflow: hidden;
		width:100%;
    }

    .list_com--new .view .title span{
       white-space: nowrap;
    }
    .list_com--new .view .text{
        display: flex;
        color: var(--color_primary);
        margin-left: 10px;
        border-bottom: 1px solid #ccc;
        white-space: nowrap;
    }
     .list_com--new .view .text span{
        max-width: 100px;
        overflow: hidden;
        text-overflow: ellipsis;
    }

     .list_com--new .view .number{
        color: var(--color_primary);
    }

    .list_com--new .view .image{
        width: 100%;
        border-bottom: 1px solid #ccc;
		margin-top:5px;
    }

	.list_com--new .diy_field.text{
		overflow: hidden;
		margin-right: -8px;
	}

/* new style start */

</style>

