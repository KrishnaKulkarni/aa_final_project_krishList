module UsersHelper
  def user_posts_list_item(appended_classes, options)
    options[:manage] = <<-LINKS
          <a href="#{ad_url(options[:ad_id])}/repost">repost</a>
    LINKS

    #<form class="delete-ad"
    # action="#{ad_url(options[:ad_id])}" method="post">
    #   #{auth_token}
    #   <input type="hidden" name="_method" value="DELETE">
    #   <input class="delete-ad" type="submit" value="delete">
    # </form>

    <<-HTML.html_safe
      <tr class="user-posts-list #{appended_classes.join(" ")}">
        <td class="status">#{options[:status]}</td>
        <td class="manage">#{options[:manage]}</td>
        <td class="title">#{options[:title]}</td>
        <td class="region"><strong>#{options[:region]}</strong></td>
        <td class="category">#{options[:category]}</td>
        <td class="posted-date">#{options[:posted_date]}</td>
        <td class="responses">
          <a href="#{user_ad_responses_url(current_user.id, options[:ad_id])}">
            #{options[:responses]}
          </a>
        </td>
      </tr>
    HTML
  end

  # <% @user.posted_ads.each do |ad|  %>
  #       <% options = {ad_id: ad.id,
  #       status: 'Active',
  #       title: "<a href="">#{h(ad.title)}</a>".html_safe,
  #       region: ad.region,
  #       category: ad.subcat.title,
  #       posted_date: ad.created_at,
  #       responses: ad.responses_count} %>
  #     <%= user_posts_list_item([], options) %>
  #   <% end  %>

  def user_posts_list(ads)
    #Implement Active/ Expired Later
    output = ""
    ads.each do |ad|
      status = (ad.title.length % 4 > 0) ? "active" : "expired"
      output += <<-HTML.html_safe
      <tr class="user-posts-list #{status}">
        <td class="status">#{status.capitalize}</td>
        <td class="manage"><a href="#{ad_url(ad)}/repost">repost</a></td>
        <td class="title">
          <a href="#{subcat_ad_url(ad.subcat, ad)}">
            #{h(ad.title)}
          </a>
        </td>
        <td class="region"><strong>#{h(ad.region)}</strong></td>
        <td class="category">#{h(ad.subcat.title)}</td>
        <td class="posted-date">#{h(ad.created_at)}</td>
        <td class="responses">
          #{}
          <a href="#{user_ad_responses_url(current_user, ad)}">
            #{ad.responses_count}
          </a>
        </td>
      </tr>
    HTML
    end
    output.html_safe
  end

  def account_header(user)
    <<-HTML.html_safe
		<nav class="account-nav y-on-b">
			<ul class="account-nav-links clearfix">
				<li>
					<a class="user-dashboard-nav first" href="#{user_ads_url(user)}">
					postings
				</a>
				</li>
				<li>
					<a class="user-dashboard-nav" href="#{user_url(user)}">
					settings
				</a>
				</li>
				<li>
					<a class="user-dashboard-nav" href="#{user_notifications_url(user)}">
					notifications
				</a>
				</li>
				<li>
					<a class="user-dashboard-nav last" href="#{user_alerts_url(user)}">
					alerts
				</a>
				</li>
			</ul>
		 </nav>
    HTML
  end
end
