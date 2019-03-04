var ATTACH_ACCESS_KEY
var ITEM_IDS;
var COMMENT_UNFOLD;
var QUESTION_ID;
var UNINTERESTED_COUNT;

$(function() {
	
    //问题页添加评论
    init_comment_box('.aw-add-comment');

	if ($('.aw-vote-count').length)
	{
		$.each($('.aw-vote-count'), function (i, e)
		{
			$(e).click();
		});
	}
	
	if ($('#c_log_list').attr('id'))
	{
		bp_more_load(G_BASE_URL + '/question/ajax/log/id-' + QUESTION_ID, $('#bp_log_more'), $('#c_log_list'));
	}
	else
	{
		ITEM_IDS = ITEM_IDS.split(',');
	
		if ($("#captcha").attr('id'))
		{
			$("#captcha").click();
		}
		
		init_fileuploader('file_uploader_answer', G_BASE_URL + '/publish/ajax/attach_upload/id-answer__attach_access_key-' + ATTACH_ACCESS_KEY);
		
		// 折叠回复
		$.each($('div.aw-item'), function (i, e) {
			if ($(this).attr('uninterested_count') >= UNINTERESTED_COUNT || $(this).attr('force_fold') == 1)
			{
				$('#uninterested_answers_list').append('<div class="aw-item">' + $(e).html() + '</div>');
				
				$(e).remove();
			}
		});
		
		if ($('#uninterested_answers_list div.aw-item').length > 0)
		{
			$('#load_uninterested_answers span.hide_answers_count').html($('#uninterested_answers_list div.aw-item').length);
			$('#load_uninterested_answers').fadeIn();
		}
		
		// 自动保存草稿
		if ($('textarea#advanced_editor').length)
		{
			$('textarea#advanced_editor').bind('blur', function() {
				if ($(this).val() != '')
				{
					$.post(G_BASE_URL + '/account/ajax/save_draft/item_id-' + QUESTION_ID + '__type-answer', 'message=' + $(this).val(), function (result) {
						$('#answer_content_message').html(result.err + ' <a href="#" onclick="$(\'textarea#advanced_editor\').attr(\'value\', \'\'); delete_draft(QUESTION_ID, \'answer\'); $(this).parent().html(\' \'); return false;">' + _t('删除草稿') + '</a>');
					}, 'json');
				}
			});
		}
		
		if (COMMENT_UNFOLD == 'all')
		{
			$('.aw-add-comment').click();
		}
		else if (COMMENT_UNFOLD == 'question')
		{
			$('.aw-question-detail-meta .aw-add-comment').click();
		}
		
		// 回复高亮
		$.each(ITEM_IDS, function (i, answer_id) {
			if ($('#answer_list_' + answer_id).attr('id'))
			{
				if ($('#answer_list_' + answer_id).find('.aw-add-comment').data('comment-count') > 0)
				{
					$('#answer_list_' + answer_id).find('.aw-add-comment').click();
				}
						
				hightlight($('#answer_list_' + answer_id), 'active');
			}
		});
	}
	
	/* 关注用户列表 */
	$.get(G_BASE_URL + '/question/ajax/get_focus_users/question_id-' + QUESTION_ID, function (data) {
		if (data)
		{
			$.each(data, function (i, d) {
				if (d['uid'])
				{
					$('#focus_users').append('<a href="' + d['url'] + '"><img src="' + d['avatar_file'] + '" class="aw-user-name" data-id="' + d['uid'] + '" alt="' + d['user_name'] + '" /></a> ');
				}
				else
				{
					$('#focus_users').append('<a href="javascript:;" title="' + _t('匿名用户') + '"><img src="' + d['avatar_file'] + '" alt="' + _t('匿名用户') + '" /></a> ');
				}
			});
		}
	}, 'json');
	
    //邀请回答按钮操作
    $('.aw-question-detail-title .aw-invite-replay').click(function()
    {
    	$('.aw-question-detail-title .aw-comment-box, .aw-question-detail-title .aw-question-related-box').hide();
    	if ($('.aw-question-detail-title .aw-invite-box').is(':visible'))
    	{
    		$('.aw-question-detail-title .aw-invite-box').fadeOut();
    	}
    	else
    	{
    		/*给邀请三角形定位*/
    		$('.aw-question-detail-title .aw-invite-box > .i-dropdown-triangle').css('left', $(this).width() / 2 + $(this).position().left);
    		$('.aw-question-detail-title .aw-invite-box').fadeIn();
    	}
    });
    
    //邀请初始化
    $('.aw-question-detail-title .aw-invite-box ul li').hide();
    
    for (var i = 0; i < 3; i++)
    {
    	$('.aw-question-detail-title .aw-invite-box ul li').eq(i).show();
    }
    
    //长度小于3翻页隐藏
    if ($('.aw-question-detail-title .aw-invite-box ul li').length <=3 )
    {
    	$('.aw-question-detail-title .aw-invite-box .aw-mod-footer').hide();
    }
    else
    {
    	//邀请上一页
	    $('.aw-question-detail-title .aw-invite-box .prev').click(function()
	    {
	    	if (!$(this).hasClass('active'))
	    	{
	    		var attr = [],li_length = $('.aw-question-detail-title .aw-invite-box ul li').length;
		    	$.each($('.aw-question-detail-title .aw-invite-box ul li'), function (i, e)
		    	{
		    		if ($(this).is(':visible') == true)
		    		{
		    			attr.push($(this).index());
		    		}
		    	});
		    	$('.aw-question-detail-title .aw-invite-box ul li').hide();
		    	$.each(attr, function (i, e)
		    	{
					if (attr.join('') == '123' || attr.join('') == '234')
					{
						$('.aw-question-detail-title .aw-invite-box ul li').eq(0).show();
						$('.aw-question-detail-title .aw-invite-box ul li').eq(1).show();
						$('.aw-question-detail-title .aw-invite-box ul li').eq(2).show();
					}
					else
					{
		    			$('.aw-question-detail-title .aw-invite-box ul li').eq(e-3).show();
					}
		    		
		    		if (e-3 == 0)
		    		{
		    			$('.aw-question-detail-title .aw-invite-box .prev').addClass('active');
		    		}
		    	});
		    	$('.aw-question-detail-title .aw-invite-box .next').removeClass('active');
	    	}
	    });

	    //邀请下一页
	    $('.aw-question-detail-title .aw-invite-box .next').click(function()
	    {
	    	if (!$(this).hasClass('active'))
	    	{
				var attr = [], li_length = $('.aw-question-detail-title .aw-invite-box ul li').length;
		    	$.each($('.aw-question-detail-title .aw-invite-box ul li'), function (i, e)
		    	{
		    		if ($(this).is(':visible') == true)
		    		{
		    			attr.push($(this).index());
		    		}
		    	});
		    	$.each(attr, function (i, e)
		    	{
		    		if (e+3 < li_length)
		    		{
		    			$('.aw-question-detail-title .aw-invite-box ul li').eq(e).hide();
		    			$('.aw-question-detail-title .aw-invite-box ul li').eq(e+3).show();
		    		}
		    		if (e+4 == $('.aw-question-detail-title .aw-invite-box ul li').length)
		    		{
		    			$('.aw-question-detail-title .aw-invite-box .next').addClass('active');
		    		}
		    	});
		    	$('.aw-question-detail-title .aw-invite-box .prev').removeClass('active');
	    	}
	    });
    }

    //邀请用户下拉绑定
    bind_dropdown_list($('.aw-invite-box #invite-input'), 'invite');
    
    //邀请用户回答点击事件
	$(document).on('click', '.aw-invite-box .aw-dropdown-list a', function () {
	    invite_user($(this),$(this).find('img').attr('src'));
	});

	//相关链接按钮
	$('.aw-question-detail-title .aw-add-question-related').click(function()
	{
		$('.aw-question-detail-title .aw-comment-box, .aw-question-detail-title .aw-invite-box').hide();
    	if ($('.aw-question-detail-title .aw-question-related-box').is(':visible'))
    	{
    		$('.aw-question-detail-title .aw-question-related-box').fadeOut();
    	}
    	else
    	{
    		/*给邀请三角形定位*/
    		$('.aw-question-detail-title .aw-question-related-box .i-dropdown-triangle').css('left', $(this).width() / 2 + $(this).position().left);
    		$('.aw-question-detail-title .aw-question-related-box').fadeIn();
    	}
	});

    //回复内容超链接新窗口打开
    $('.markitup-box a').attr('target','_blank');
	
	//编辑器@人
    at_user_lists('#advanced_editor');

    //回复折叠显示按钮
    $('#load_uninterested_answers a').click(function()
    {
        if ($('#uninterested_answers_list').is(':visible'))
        {
            $('#uninterested_answers_list').hide();
        }
        else
        {
            $('#uninterested_answers_list').show();
        }
    });

    //赞同反对fixed滚动
    $(window).scroll(function()
    {
    	if ($('.aw-question-comment-box .aw-vote-bar').css('position') == 'absolute')
    	{

    		$.each($('.anchor'), function (i, e)
	    	{
	    		if ($(this).parents('.aw-item').height() > parseInt($(this).parents('.aw-item').find('.markitup-box').css('line-height')) * 10)
	    		{
	    			if ($(window).scrollTop() > $(this).offset().top && $(window).scrollTop() < $(this).offset().top + $(this).parents('.aw-item').height() - $(this).parents('.aw-item').find('.vote-container').height() - 10)
		    		{
		    			$(this).parents('.aw-item').find('.aw-vote-bar').addClass('fixed');
		    		}
		    		else 
		    		{
		    			$(this).parents('.aw-item').find('.aw-vote-bar').removeClass('fixed');
		    		}
	    		}
	    	});
    	}
    });


});

function answer_force_fold(answer_id, element)
{
	$.post(G_BASE_URL + '/question/ajax/answer_force_fold/', 'answer_id=' + answer_id, function (result) {
		if (result.errno != 1)
		{
			$.alert(result.err);
		}
		else if (result.errno == 1)
		{
			if (result.rsm.action == 'fold')
			{
				$(element).html($(element).html().replace(_t('折叠'), _t('撤消折叠')));
			}
			else
			{
				$(element).html($(element).html().replace(_t('撤消折叠'), _t('折叠')));
			}
		}
	}, 'json');
}

function one_click_add_topic(click_element, topic_title, question_id)
{
	$.post(G_BASE_URL + '/topic/ajax/save_topic_relation/', 'type=question&item_id=' + question_id + '&topic_title=' + topic_title, function (result) {
		if (result.err)
		{
			$.alert(result.err);
		}
		else
		{
			$('.aw-topic-editor').prepend('<a href="topic/' + result.rsm.topic_id + '" class="aw-topic-name"><span>' + topic_title + '</span></a>').hide().fadeIn();
			
			$(click_element).hide();
		}
	}, 'json');
}