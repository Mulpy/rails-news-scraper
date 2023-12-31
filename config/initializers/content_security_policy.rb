# Be sure to restart your server when you modify this file.

# Define an application-wide content security policy.
# See the Securing Rails Applications Guide for more information:
# https://guides.rubyonrails.org/security.html#content-security-policy-header

Rails.application.configure do
  config.content_security_policy do |policy|
    # Allow loading from our own domain and HTTPS only
    policy.default_src :self, :https
    policy.font_src    :self, "https://fonts.gstatic.com/s/nunito/v26/XRXV3I6Li01BKofIOOaBXso.woff2",
      "https://fonts.gstatic.com/s/nunito/v26/XRXV3I6Li01BKofIMeaBXso.woff2",
      "https://fonts.gstatic.com/s/nunito/v26/XRXV3I6Li01BKofIOuaBXso.woff2",
      "https://fonts.gstatic.com/s/nunito/v26/XRXV3I6Li01BKofIO-aBXso.woff2",
      "https://fonts.gstatic.com/s/nunito/v26/XRXV3I6Li01BKofINeaB.woff2",
      "https://fonts.gstatic.com/s/worksans/v19/QGYsz_wNahGAdqQ43Rh_c6Dpp_k.woff2",
      "https://fonts.gstatic.com/s/worksans/v19/QGYsz_wNahGAdqQ43Rh_cqDpp_k.woff2",
      "https://fonts.gstatic.com/s/worksans/v19/QGYsz_wNahGAdqQ43Rh_fKDp.woff2"  # , :https, :data
    # Allow images from our own domain and HTTPS
    policy.img_src     :self, :https, :data
    # Forbid <object>, <embed>, and other legacy tags
    policy.object_src  :none
    # Specify scripts and styles allowed to run
    policy.script_src  'nonce-rAnd0m123' 'strict-dynamic', :https, 'unsafe-inline'
    # 'http://127.0.0.1:3000/assets/es-module-shims.min-4ca9b3dd5e434131e3bb4b0c1d7dff3bfd4035672a5086deec6f73979a49be73.js' # :self, "https://cdn.jsdelivr.net/npm/star-rating.js@4.3.0/dist/star-rating.esm.js" # , :https # , :unsafe_inline
    policy.style_src   :self,  "https://fonts.googleapis.com/css",  # ?family=Nunito:400,700|Work+Sans:400,700&display=swap
      "https://ga.jspm.io/npm:star-rating.js@4.3.0/dist/star-rating.css" # , :https
    policy.base_uri    :none  # :self  # , :https
    policy.require_trusted_types_for 'script'
    #  # Specify URI for violation reports
    # policy.report_uri "/csp-violation-report-endpoint"
  end

  # Generate session nonces for permitted importmap and inline scripts
  config.content_security_policy_nonce_generator = ->(request) { request.session.id.to_s }
  config.content_security_policy_nonce_directives = %w(script)

  # Report violations without enforcing the policy.
  config.content_security_policy_report_only = true
end
