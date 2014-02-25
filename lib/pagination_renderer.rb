class PaginationRenderer < WillPaginate::ActionView::LinkRenderer
  protected

  def pagination
    [ :next_page, :previous_page ]
  end
end
