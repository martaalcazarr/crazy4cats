class ReactionsController < ApplicationController
  before_action :set_post_and_comment, only: [:new_user_reaction]

  def new_user_reaction
    @user = current_user
    @type = params[:reaction_type]
    @kind = params[:kind]

    respond_to do |format|
      if @type == "comment" && @comment.nil?
        format.html { redirect_to posts_path, notice: 'Invalid comment' }
      elsif @type == "post" && @post.nil?
        format.html { redirect_to posts_path, notice: 'Invalid post' }
      else
        if @type == "post" && @post.present?
          @reaction = Reaction.new(user_id: @user.id, post_id: @post.id, reaction_type: @type, kind: @kind)
        elsif @type == "comment" && @comment.present?
          @reaction = Reaction.new(user_id: @user.id, comment_id: @comment.id, reaction_type: @type, kind: @kind)
        end

        if @reaction&.save
          format.html { redirect_to post_path(@post), notice: 'Reaction was successfully created.' }
        else
          format.html { redirect_to post_path(@post), notice: 'Something went wrong' }
        end
      end
    end
  end

  private

  def set_post_and_comment
    @post = Post.find_by(id: params[:post_id])
    @comment = Comment.find_by(id: params[:comment_id])
  end
end
