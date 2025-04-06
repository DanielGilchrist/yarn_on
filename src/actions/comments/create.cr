class Comments::Create < BrowserAction
  post "/comments" do
    SaveComment.create(params) do |operation, comment|
      if comment
        flash.success = "The record has been saved"
        redirect Show.with(comment.id)
      else
        flash.failure = "It looks like the form is not valid"
        html NewPage, operation: operation
      end
    end
  end
end
