<input type="hidden" template-variable="expose_tools" value="{expose_tools}" />
<input type="hidden" template-variable="topic_id" value="{tid}" />
<input type="hidden" template-variable="category_id" value="{category.cid}" />
<input type="hidden" template-variable="currentPage" value="{currentPage}" />
<input type="hidden" template-variable="pageCount" value="{pageCount}" />
<input type="hidden" template-variable="locked" value="{locked}" />
<input type="hidden" template-variable="deleted" value="{deleted}" />
<input type="hidden" template-variable="pinned" value="{pinned}" />
<input type="hidden" template-variable="topic_name" value="{title}" />
<input type="hidden" template-variable="postcount" value="{postcount}" />
<input type="hidden" template-variable="viewcount" value="{viewcount}" />

<div class="topic">
	<ol class="breadcrumb">
		<li itemscope="itemscope" itemtype="http://data-vocabulary.org/Breadcrumb">
			<a href="{relative_path}/" itemprop="url"><span itemprop="title">[[global:home]]</span></a>
		</li>
		<li itemscope="itemscope" itemtype="http://data-vocabulary.org/Breadcrumb">
			<a href="{relative_path}/category/{category.slug}" itemprop="url"><span itemprop="title">{category.name}</span></a>
		</li>
		<li class="active" itemscope="itemscope" itemtype="http://data-vocabulary.org/Breadcrumb">
			<span itemprop="title">{title} <a target="_blank" href="../{tid}.rss"><i class="fa fa-rss-square"></i></a></span>
		</li>
		<div class="loading-indicator pull-right" done="0" style="display:none;">
			<i class="fa fa-refresh fa-spin"></i>
		</div>
	</ol>

	<ul id="post-container" class="posts" data-tid="{tid}">
		<!-- BEGIN posts -->
			<li class="post-row<!-- IF posts.deleted --> deleted<!-- ENDIF posts.deleted -->" data-pid="{posts.pid}" data-uid="{posts.uid}" data-username="{posts.user.username}" data-userslug="{posts.user.userslug}" data-index="{posts.index}" itemscope itemtype="http://schema.org/Comment">
				<a id="post_anchor_{posts.pid}" name="{posts.pid}"></a>

				<meta itemprop="datePublished" content="{posts.relativeTime}">
				<meta itemprop="dateModified" content="{posts.relativeEditTime}">

				<div class="col-md-1 profile-image-block hidden-xs hidden-sm sub-post">
					<a href="<!-- IF posts.user.userslug -->{relative_path}/user/{posts.user.userslug}<!-- ELSE -->#<!-- ENDIF posts.user.userslug -->">
						<img src="{posts.user.picture}" align="left" class="img-thumbnail" itemprop="image" />
						<!-- IF posts.user.banned -->
						<span class="label label-danger">[[topic:banned]]</span>
						<!-- ENDIF posts.user.banned -->
					</a>
				</div>

				<div class="col-md-11 panel panel-default post-block topic-item">

					<a class="main-post avatar" href="<!-- IF posts.user.userslug -->{relative_path}/user/{posts.user.userslug}<!-- ELSE -->#<!-- ENDIF posts.user.userslug -->">
						<img itemprop="image" src="{posts.user.picture}" align="left" class="img-thumbnail" width=150 height=150 />
					</a>
					<h3 class="main-post">
						<p id="topic_title_{posts.pid}" class="topic-title" itemprop="name">{title}</p>
					</h3>

					<div class="topic-buttons">

						<div class="btn-group">
							<button class="btn btn-sm btn-default dropdown-toggle" data-toggle="dropdown" type="button" title="[[topic:posted_by, {posts.user.username}]]">
								<i class="fa fa-circle status offline"></i>
								<span class="visible-xs-inline visible-md-inline"><img class="" src="{posts.picture}" width=18 height=18 />&nbsp;</span>
								<span class="username-field" href="<!-- IF posts.user.userslug -->{relative_path}/user/{posts.user.userslug}<!-- ELSE -->#<!-- ENDIF posts.user.userslug -->" itemprop="author" data-username="{posts.username}">{posts.user.username}&nbsp;</span>
								<span class="caret"></span>
							</button>

						    <ul class="dropdown-menu">
								<li><a href="<!-- IF posts.user.userslug -->{relative_path}/user/{posts.user.userslug}<!-- ELSE -->#<!-- ENDIF posts.user.userslug -->"><i class="fa fa-user"></i> [[topic:profile]]</a></li>
								<li><a href="#" class="chat"><i class="fa fa-comment"></i> [[topic:chat]]</a></li>
						    </ul>
						</div>

						<div class="btn-group">
							<button class="btn btn-sm btn-default follow hide" type="button" title="[[topic:notify_me]]"><i class="fa fa-eye"></i></button>
							<button class="btn btn-sm btn-default flag" type="button" title="[[topic:flag_title]]"><i class="fa fa-flag-o"></i></button>
							<button data-favourited="{posts.favourited}" class="favourite favourite-tooltip btn btn-sm btn-default <!-- IF posts.favourited --> btn-warning <!-- ENDIF posts.favourited -->" type="button">
								<span class="favourite-text">[[topic:favourite]]</span>
								<span class="favouriteCount" data-favourites="{posts.reputation}">{posts.reputation}</span>&nbsp;
								<!-- IF posts.favourited -->
								<i class="fa fa-star"></i>
								<!-- ELSE -->
								<i class="fa fa-star-o"></i>
								<!-- ENDIF posts.favourited -->
							</button>
						</div>

						<div class="btn-group">
							<button class="upvote btn btn-sm btn-default <!-- IF posts.upvoted --> upvoted btn-primary <!-- ENDIF posts.upvoted -->">
								<i class="fa fa-chevron-up"></i>
							</button>
							<button class="votes btn btn-sm btn-default" data-votes="{posts.votes}" disabled>{posts.votes}</button>
							<button class="downvote btn btn-sm btn-default <!-- IF posts.downvoted --> downvoted btn-primary <!-- ENDIF posts.downvoted -->">
								<i class="fa fa-chevron-down"></i>
							</button>
						</div>

						<!-- IF privileges.write -->
						<div class="btn-group">
							<button class="btn btn-sm btn-default quote" type="button" title="[[topic:quote]]"><i class="fa fa-quote-left"></i></button>
							<button class="btn btn-sm btn-primary btn post_reply" type="button">[[topic:reply]] <i class="fa fa-reply"></i></button>
						</div>
						<!-- ENDIF privileges.write -->

						<div class="pull-right">
							<div class="btn-group post-tools">
								<div class="dropdown share-dropdown pull-right">
									<button title="[[topic:share]]"class="btn btn-sm btn-default share" data-toggle="dropdown" href="#"><i class="fa fa-share-square-o"></i></button>
									<!-- IMPORT partials/share_dropdown.tpl -->
								</div>
							</div>

							<!-- IF posts.display_moderator_tools -->
							<div class="btn-group post-tools">
								<div class="dropdown">
									<button title="[[topic:tools]]" class="btn btn-sm btn-default" data-toggle="dropdown" href="#"><i class="fa fa-gear"></i></button>
									<ul class="dropdown-menu text-center pull-right" role="menu" aria-labelledby="dLabel">
										<button class="btn btn-sm btn-default edit" type="button" title="[[topic:edit]]"><i class="fa fa-pencil"></i></button>
										<button class="btn btn-sm btn-default delete" type="button" title="[[topic:delete]]"><i class="fa fa-trash-o"></i></button>

										<!-- IF posts.display_move_tools -->
										<button class="btn btn-sm btn-default move" type="button" title="[[topic:move]]"><i class="fa fa-arrows"></i></button>
										<!-- ENDIF posts.display_move_tools -->
									</ul>
								</div>
							</div>
							<!-- ENDIF posts.display_moderator_tools -->
						</div>
					</div>

					<div id="content_{posts.pid}" class="post-content" itemprop="text">{posts.content}</div>
					<!-- IF posts.user.signature -->
					<div class="post-signature">{posts.user.signature}</div>
					<!-- ENDIF posts.user.signature -->

					<div class="post-info">
						<span class="pull-right">
							[[global:posted_ago, <span class="timeago" title="{posts.relativeTime}"></span>]]
							<!-- IF posts.editor.username -->
							<span>| [[global:last_edited_by_ago, <strong><a href="{relative_path}/user/{posts.editor.userslug}">{posts.editor.username}</a></strong>, <span class="timeago" title="{posts.relativeTime}"></span>]]</span>
							<!-- ENDIF posts.editor.username -->
						</span>
						<span class="pull-left">
							[[global:reputation]]: <i class='fa fa-star'></i> <span data-reputation="{posts.user.reputation}" data-uid="{posts.uid}" class='formatted-number reputation'>{posts.user.reputation}</span>&nbsp;|&nbsp;[[global:posts]]: <i class='fa fa-pencil'></i> <span class='formatted-number user_postcount_{posts.uid}'>{posts.user.postcount}</span>
							<!-- IF custom_profile_info -->
								<!-- BEGIN custom_profile_info -->
								| {posts.custom_profile_info.content}
								<!-- END custom_profile_info -->
							<!-- ENDIF custom_profile_info -->
						</span>
						<div style="clear:both;"></div>
					</div>
				</div>
				<div style="clear:both;"></div>
			</li>

			<!-- IF !posts.index -->
			<li class="well post-bar" data-index="{posts.index}">
				<!-- IMPORT partials/post_bar.tpl -->
			</li>
			<!-- ENDIF !posts.index -->
		<!-- END posts -->
	</ul>

	<div class="well col-md-11 col-xs-12 pull-right post-bar bottom-post-bar hide">
		<!-- IMPORT partials/post_bar.tpl -->
	</div>

	<!-- IF config.usePagination -->
	<div class="text-center">
		<ul class="pagination">
			<li class="previous pull-left"><a href="#"><i class="fa fa-chevron-left"></i> [[global:previouspage]]</a></li>
			<li class="next pull-right"><a href="#">[[global:nextpage]] <i class="fa fa-chevron-right"></i></a></li>
		</ul>
	</div>
	<!-- ENDIF config.usePagination -->

	<!-- IMPORT partials/move_thread_modal.tpl -->
	<!-- IMPORT partials/fork_thread_modal.tpl -->
	<!-- IMPORT partials/move_post_modal.tpl -->

</div>

<div widget-area="footer" class="col-xs-12"></div>

<!-- IMPORT partials/noscript/paginator.tpl -->