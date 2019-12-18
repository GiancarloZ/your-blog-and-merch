
[1mFrom:[0m /mnt/c/Users/gzaba/dev/flatiron/Projects/your-blog-and-merch/app/controllers/comments_controller.rb @ line 18 CommentsController#create:

    [1;34m16[0m: [32mdef[0m [1;34mcreate[0m
    [1;34m17[0m:     @comment = [1;34;4mComment[0m.create(comment_params)
 => [1;34m18[0m:     binding.pry
    [1;34m19[0m:     [32mif[0m @comment.save
    [1;34m20[0m:         redirect_to post_comments_path
    [1;34m21[0m:     [1;34m# else[0m
    [1;34m22[0m:     [1;34m#     redirect_to post_path(@comment.post_id)[0m
    [1;34m23[0m:     [32mend[0m
    [1;34m24[0m: 
    [1;34m25[0m: [32mend[0m

