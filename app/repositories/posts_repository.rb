class PostsRepository 
  # class method
  class << self
    def find_all(**kwargs)
      order_by = "asc"
      if kwargs.has_key?(:order_by) 
        order_by = kwargs[:order_by]
      end
      Post.order(created_at: order_by)
    end

    def find_by_slug(slug)
      if slug.blank?
        return nil
      end

      post = Post.find_by(slug: slug)      
      if post.nil? 
        return nil
      end
      
      return post
    end

    def save(req)
      # inject slug
      slug = req[:title].to_s.parameterize
      req[:slug] = slug

      post = Post.create(req)
      if post.invalid?
        return false
      end

      post.save
      return true
    end

    def save!(req)
      valid = self.save(req)
      if !valid 
        raise "Error record"
      end
    end
  end
end 