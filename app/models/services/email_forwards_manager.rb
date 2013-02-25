require_relative "../../../lib/dnsimple"

class EmailForwardsManager
  def initialize(client)
    @client = client
  end

  def create(hash)
    EmailForward.create(hash) do |email_forward|
      if email_forward.valid?
        response = @client.post("email_forwards", email_forward: {
          from: email_forward.from.chomp("@outwardbound.hr"),
          to:   email_forward.to,
        })
        email_forward.uid = response["email_forward"]["id"]
      end
    end
  end

  def destroy(id)
    EmailForward.destroy(id).tap do |email_forward|
      @client.delete("email_forwards/#{email_forward.uid}")
    end
  end

  def update_all
    email_forwards = @client.get("email_forwards").map do |hash|
      {
        from: hash["email_forward"]["from"],
        to:   hash["email_forward"]["to"],
        uid:  hash["email_forward"]["id"],
      }
    end
    EmailForward.destroy_all
    EmailForward.create(email_forwards)
  end

  def method_missing(name, *args, &block)
    EmailForward.send(name, *args, &block)
  end
end
