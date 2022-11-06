/* vim:ft=javascript:
|* file:$XDG_CONFIG_HOME/firefox/fast.js
\******************************************************************************/


user_pref("browser.anchor_color", "#6A759F"); // #0000EE

user_pref("browser.display.background_color", "#151515"); // #FFFFFF
user_pref("browser.display.foreground_color", "#D0D0D0"); // #000000
user_pref("browser.display.use_system_colors", true); // false

user_pref("browser.visited_color", "#714E6A"); // #551A8B

user_pref("browser.tabs.inTitlebar", 0); // 2

user_pref("browser.warnOnQuit", false); // true
user_pref("browser.warnOnQuitShortcut", false); // true

user_pref("font.default.x-western", "sans-serif"); // SYSTEM
user_pref("font.minimum-size.x-western", 12); // 0
user_pref("font.name.monospace.x-western", "monospace"); // SYSTEM
user_pref("font.name.sans-serif.x-western", "sans-serif"); // SYSTEM
user_pref("font.name.serif.x-western", "serif"); // SYSTEM
user_pref("font.size.monospace.x-western", 12); // 12
user_pref("font.size.variable.x-western", 12); // 16

user_pref("reader.content_width", 3); // 3
user_pref("reader.font_size", 5); // 5
user_pref("reader.font_type", "monospace"); // SYSTEM
user_pref("reader.line_height", 4); // 4

user_pref("widget.wayland.opaque-region.enabled", false); // true
user_pref("widget.gtk.non-native-titlebar-buttons.enabled", false); // true

user_pref("clipboard.autocopy", false); // true
user_pref("middlemouse.paste", false); // true


/******************************************************************************\
|*                                   FASTFOX                                  *|
\******************************************************************************/


user_pref("content.notify.interval", 100000); // 120000

// TODO: Does it even work?
user_pref("gfx.webrender.all", true); // false
user_pref("gfx.webrender.compositor", true); // false
user_pref("gfx.webrender.compositor.force-enabled", true); // false
user_pref("gfx.webrender.precache-shaders", true); // false

// user_pref("gfx.canvas.accelerated", false); // true
user_pref("gfx.canvas.accelerated.cache-items", 8192); // 2048
user_pref("gfx.canvas.accelerated.cache-size", 1024); // 256
user_pref("gfx.content.skia-font-cache-size", 20); // 5

// user_pref("media.hardware-video-decoding.enabled", false); // true
user_pref("media.hardware-video-decoding.force-enabled", true); // false
user_pref("media.gpu-process-decoder", true); // false
// user_pref("media.ffmpeg.enabled", false); // true
user_pref("media.ffmpeg.vaapi.enabled", true); // false

user_pref("browser.cache.disk.enable", false); // true
// user_pref("browser.cache.disk.capacity", 1024000); // 256000
// user_pref("browser.cache.disk.metadata_memory_limit", 500); // 250
// user_pref("browser.cache.disk.preload_chunk_count", 4); // 4
// user_pref("browser.cache.frecency_half_life_hours", 6); // 6
// user_pref("browser.cache.disk.max_chunks_memory_usage", 40960); // 40960
// user_pref("browser.cache.disk.max_priority_chunks_memory_usage", 40960); // 40960
// user_pref("browser.cache.check_doc_frequency", 0); // 3
// user_pref("browser.cache.disk.free_space_soft_limit", 10240); // 5120
// user_pref("browser.cache.disk.free_space_hard_limit", 2048); // 1024

// user_pref("browser.cache.jsbc_compression_level", 3); // 0

// user_pref("network.http.rcwn.enabled", false); // true
// user_pref("network.http.rcwn.small_resource_size_kb", 256); // 256

// user_pref("dom.script_loader.bytecode_cache.enabled", false); // true
// user_pref("dom.script_loader.bytecode_cache.strategy", -1); // 0

// user_pref("browser.cache.memory.enable", false); // true
user_pref("browser.cache.memory.capacity", 2097152); // -1
user_pref("browser.cache.memory.max_entry_size", 10240); // 5120

user_pref("browser.sessionhistory.max_total_viewers", 4); // -1

user_pref("media.memory_cache_max_size", 131072); // 8192
user_pref("media.memory_caches_combined_limit_kb", 1048576); // 524288
user_pref("media.memory_caches_combined_limit_pc_sysmem", 10); // 5

user_pref("media.cache_readahead_limit", 7200); // 60
user_pref("media.cache_resume_threshold", 3600); // 30

user_pref("image.cache.size", 10485760); // 5242880
user_pref("image.mem.decode_bytes_at_a_time", 65536); // 16384

user_pref("network.http.max-connections", 1800); // 900
user_pref("network.http.max-persistent-connections-per-server", 10); // 6
user_pref("network.http.max-urgent-start-excessive-connections-per-host", 5); // 3
user_pref("network.http.max-persistent-connections-per-proxy", 48); // 32

user_pref("network.http.pacing.requests.enabled", false); // true

user_pref("network.dnsCacheEntries", 1000); // 400
user_pref("network.dnsCacheExpiration", 3600); // 60

user_pref("network.ssl_tokens_cache_capacity", 10240); // 2048

user_pref("network.dns.disablePrefetch", true); // false
user_pref("network.dns.disablePrefetchFromHTTPS", true); // false

user_pref("dom.prefetch_dns_for_anchor_http_document", false); // true
// user_pref("dom.prefetch_dns_for_anchor_https_document", true); // false

// user_pref("network.http.speculative-parallel-limit", 0); // 20
user_pref("network.predictor.enabled", false); // true
user_pref("network.prefetch-next", false); // true
// user_pref("network.predictor.enable-prefetch", true); // false
// user_pref("network.predictor.enable-hover-on-ssl", true); // false

user_pref("browser.urlbar.speculativeConnect.enabled", false); // true
user_pref("browser.places.speculativeConnect.enabled", false); // true

// user_pref("layout.css.grid-template-masonry-value.enabled", true); // false

user_pref("dom.enable_web_task_scheduling", true); // false

// user_pref("dom.security.sanitizer.enabled", true); // false

user_pref("browser.low_commit_space_threshold_mb", 3276); // 200
user_pref("browser.low_commit_space_threshold_percent", 20); // 5
user_pref("browser.tabs.min_inactive_duration_before_unload", 300000); // 600000


/******************************************************************************\
|*                                   SAFEFOX                                  *|
\******************************************************************************/


user_pref("browser.contentblocking.category", "strict"); // standard

// user_pref("urlclassifier.trackingSkipURLs", ""); // HIDDEN
// user_pref("urlclassifier.features.socialtracking.skipURLs", ""); // HIDDEN

// user_pref("privacy.bounceTrackingProtection.enabled", false); // true
user_pref("privacy.bounceTrackingProtection.enableDryRunMode", false); // true

user_pref("network.cookie.sameSite.noneRequiresSecure", true); // false

// user_pref("browser.download.folderList", 0); // 1
user_pref("browser.download.start_downloads_in_tmp_dir", true); // false
// user_pref("browser.download.useDownloadDir", false); // true
// user_pref("browser.helperApps.deleteTempFileOnExit", false); // true

user_pref("browser.uitour.enabled", false); // true
user_pref("browser.uitour.url", ""); // https://www.mozilla.org/%LOCALE%/firefox/%VERSION%/tour/

user_pref("privacy.donottrackheader.enabled", true); // false

user_pref("privacy.globalprivacycontrol.enabled", true); // false
// user_pref("privacy.globalprivacycontrol.pbmode.enabled", false); // true

user_pref("security.OCSP.enabled", 0); // 1
// user_pref("security.OCSP.require", true); // false

user_pref("security.remote_settings.crlite_filters.enabled", true); // false
user_pref("security.pki.crlite_mode", 2); // 3

user_pref("security.cert_pinning.enforcement_level", 2); // 1

user_pref("security.ssl.treat_unsafe_negotiation_as_broken", true); // false
user_pref("security.ssl.require_safe_negotiation", true); // false

user_pref("browser.xul.error_pages.expert_bad_cert", true); // false

user_pref("security.tls.enable_0rtt_data", false); // true

user_pref("network.http.http3.enable_kyber", true); // false
user_pref("security.tls.enable_kyber", true); // false

user_pref("privacy.resistFingerprinting.randomization.daily_reset.enabled", true); // false
// user_pref("privacy.resistFingerprinting.randomization.daily_reset.private.enabled", true); // false

// user_pref("privacy.resistFingerprinting", true); // false
// user_pref("privacy.resistFingerprinting.letterboxing", true); // HIDDEN
// user_pref("privacy.resistFingerprinting.autoDeclineNoUserInputCanvasPrompts", false); // true

// user_pref("webgl.disabled", true); // false

// user_pref("browser.startup.blankWindow", true); // false

user_pref("browser.privatebrowsing.forceMediaMemoryCache", true); // false

user_pref("browser.sessionstore.interval", 60000); // 15000
user_pref("browser.sessionstore.privacy_level", 2); // 0

user_pref("browser.pagethumbnails.capturing_disabled", true); // HIDDEN

user_pref("privacy.sanitize.timeSpan", 0); // 1

// user_pref("privacy.clearSiteData.cache", false); // true
// user_pref("privacy.clearSiteData.cookiesAndStorage", false); // true
user_pref("privacy.clearSiteData.historyFormDataAndDownloads", true); // false
user_pref("privacy.clearSiteData.siteSettings", true); // false

// user_pref("privacy.clearHistory.cache", false); // true
// user_pref("privacy.clearHistory.cookiesAndStorage", false); // true
// user_pref("privacy.clearHistory.historyFormDataAndDownloads", false); // true
user_pref("privacy.clearHistory.siteSettings", true); // false

// user_pref("privacy.cpd.cookies", false); // true
user_pref("privacy.cpd.offlineApps", true); // false
user_pref("privacy.cpd.openWindows", true); // false
user_pref("privacy.cpd.passwords", true); // false
user_pref("privacy.cpd.siteSettings", true); // false

user_pref("privacy.history.custom", true); // false

user_pref("privacy.sanitize.sanitizeOnShutdown", true); // false

// user_pref("privacy.clearOnShutdown.cache", false); // true
// user_pref("privacy.clearOnShutdown.cookies", false); // true
// user_pref("privacy.clearOnShutdown.downloads", false); // true
// user_pref("privacy.clearOnShutdown.formdata", false); // true
// user_pref("privacy.clearOnShutdown.history", false); // true
user_pref("privacy.clearOnShutdown.offlineApps", true); // false
user_pref("privacy.clearOnShutdown.openWindows", true); // false
user_pref("privacy.clearOnShutdown.sessions", true); // false
// user_pref("privacy.clearOnShutdown.siteSettings", true); // false

// user_pref("privacy.clearOnShutdown_v2.cache", false); // true
// user_pref("privacy.clearOnShutdown_v2.cookiesAndStorage", false); // true
// user_pref("privacy.clearOnShutdown_v2.historyFormDataAndDownloads", false); // true
user_pref("privacy.clearOnShutdown_v2.siteSettings", true); // false

user_pref("browser.urlbar.trimHttps", true); // false
user_pref("browser.urlbar.untrimOnUserInteraction.featureGate", true); // false

user_pref("security.insecure_connection_text.enabled", true);
// user_pref("security.insecure_connection_text.pbmode.enabled", true); // false

user_pref("browser.urlbar.showSearchTerms.enabled", false); // true

// user_pref("browser.search.separatePrivateDefault.ui.enabled", false); // false

user_pref("browser.urlbar.update2.engineAliasRefresh", true); // HIDDEN

user_pref("browser.search.suggest.enabled", false); // true
// user_pref("browser.search.suggest.enabled.private", true); // false
user_pref("browser.urlbar.suggest.searches", false); // true

user_pref("browser.urlbar.quicksuggest.enabled", false); // false
user_pref("browser.urlbar.suggest.quicksuggest.sponsored", false); // false
user_pref("browser.urlbar.suggest.quicksuggest.nonsponsored", false); // false
user_pref("browser.urlbar.groupLabels.enabled", false); // true

user_pref("browser.formfill.enable", false); // true

user_pref("browser.urlbar.autoFill", false); // true

user_pref("network.IDN_show_punycode", true); // false

user_pref("dom.security.https_first", true); // false
user_pref("dom.security.https_first_schemeless", true); // false

user_pref("dom.security.https_only_mode", true); // false
// user_pref("dom.security.https_only_mode_pbm", true); // false

// user_pref("dom.block_download_insecure", false); // true

user_pref("dom.security.https_only_mode_error_page_user_suggestions", true); // false

user_pref("network.proxy.type", 0); // 5

user_pref("network.trr.mode", 5); // 0
user_pref("network.trr.resolvers", '[]'); // HIDDEN

user_pref("network.notify.checkForProxies", false); // true

user_pref("signon.rememberSignons", false); // true
user_pref("signon.rememberSignons.visibilityToggle", false); // true
user_pref("signon.schemeUpgrades", false); // true
user_pref("signon.showAutoCompleteFooter", false); // true

user_pref("signon.autofillForms", false); // true

user_pref("signon.formlessCapture.enabled", false); // true

// user_pref("signon.privateBrowsingCapture.enabled", false); // true

user_pref("signon.generation.enabled", false); // true

user_pref("signon.management.page.breach-alerts.enabled", false); // true
user_pref("signon.management.page.breachAlertUrl", ""); // https://monitor.firefox.com/breach-details/
user_pref("browser.contentblocking.report.lockwise.enabled", false); // true
user_pref("browser.contentblocking.report.lockwise.how_it_works.url", ""); // https://support.mozilla.org/1/firefox/%VERSION%/%OS%/%LOCALE%/password-manager-report

user_pref("signon.firefoxRelay.feature", ""); // available
user_pref("signon.firefoxRelay.base_url", ""); // https://relay.firefox.com/api/v1/
user_pref("signon.firefoxRelay.learn_more_url", ""); // https://support.mozilla.org/1/firefox/%VERSION%/%OS%/%LOCALE%/firefox-relay-integration
user_pref("signon.firefoxRelay.manage_url", ""); // https://relay.firefox.com/accounts/profile/?utm_medium=firefox-desktop&utm_source=modal&utm_campaign=limit&utm_content=manage-masks-global
user_pref("signon.firefoxRelay.privacy_policy_url", ""); // https://www.mozilla.org/%LOCALE%/privacy/subscription-services/
user_pref("signon.firefoxRelay.terms_of_service_url", ""); // https://www.mozilla.org/%LOCALE%/about/legal/terms/subscription-services/

user_pref("signon.storeWhenAutocompleteOff", false); // true

user_pref("network.auth.subresource-http-auth-allow", 1); // 2

user_pref("editor.truncate_user_pastes", false); // true

user_pref("extensions.enabledScopes", 5);
user_pref("extensions.autoDisableScopes", 15); // 11

user_pref("extensions.formautofill.addresses.enabled", false); // true
user_pref("extensions.formautofill.creditCards.enabled", false); // true

user_pref("security.mixed_content.block_display_content", true); // false
// user_pref("security.mixed_content.upgrade_display_content", false); // true
// user_pref("security.mixed_content.upgrade_display_content.audio", false); // true
// user_pref("security.mixed_content.upgrade_display_content.image", false); // true
// user_pref("security.mixed_content.upgrade_display_content.video", false); // true

user_pref("pdfjs.enableScripting", false); // true

user_pref("extensions.postDownloadThirdPartyPrompt", false); // true

user_pref("browser.tabs.opentabfor.middleclick", false); // true
user_pref("browser.tabs.searchclipboardfor.middleclick", false); // true

// user_pref("network.http.referer.defaultPolicy.trackers", 1); // 2
// user_pref("network.http.referer.defaultPolicy.trackers.pbmode", 1); // 2

// user_pref("network.http.referer.XOriginPolicy", 1); // 0
user_pref("network.http.referer.XOriginTrimmingPolicy", 2); // 0

user_pref("privacy.userContext.enabled", true); // false
// user_pref("privacy.userContext.ui.enabled", true); // false

// user_pref("privacy.userContext.newTabContainerOnLeftClick.enabled", true); // false

user_pref("media.peerconnection.enabled", false); // true
// user_pref("media.peerconnection.ice.proxy_only_if_behind_proxy", true); // false
// user_pref("media.peerconnection.ice.default_address_only", true); // false
// user_pref("media.peerconnection.ice.no_host", true); // false

// user_pref("media.gmp-provider.enabled", false); // true
// user_pref("media.gmp-widevinecdm.enabled", false); // true

user_pref("media.eme.enabled", true); // false
// user_pref("browser.eme.ui.enabled", false); // true

// user_pref("javascript.options.asmjs", false); // true
// user_pref("javascript.options.wasm", false); // true

user_pref("browser.safebrowsing.downloads.remote.enabled", false); // true
user_pref("browser.safebrowsing.downloads.remote.url", ""); // https://sb-ssl.google.com/safebrowsing/clientreport/download?key=%GOOGLE_SAFEBROWSING_API_KEY%
user_pref("browser.safebrowsing.downloads.remote.block_potentially_unwanted", false); // true
user_pref("browser.safebrowsing.downloads.remote.block_uncommon", false); // true

user_pref("accessibility.force_disabled", 1); // 0
user_pref("devtools.accessibility.enabled", false); // true

user_pref("identity.fxaccounts.enabled", false); // true
user_pref("identity.fxaccounts.autoconfig.uri", ""); // HIDDEN

user_pref("browser.firefox-view.feature-tour", "{\"screen\":\"\",\"complete\":true}"); // {"screen":"FIREFOX_VIEW_SPOTLIGHT","complete":false}

user_pref("dom.push.enabled", false); // true
user_pref("dom.push.userAgentID", ""); // RANDOM

user_pref("permissions.default.camera", 2); // 0
user_pref("permissions.default.desktop-notification", 2); // 0
user_pref("permissions.default.geo", 2); // 0
user_pref("permissions.default.microphone", 2); // 0
user_pref("permissions.default.xr", 2); // 0

// user_pref("permissions.isolateBy.userContext", true); // false
// user_pref("permissions.isolateBy.privateBrowsing", false); // true

user_pref("geo.provider.network.url", "https://location.services.mozilla.com/v1/geolocate?key=%MOZILLA_API_KEY%"); // https://www.googleapis.com/geolocation/v1/geolocate?key=%GOOGLE_LOCATION_SERVICE_API_KEY%
// user_pref("geo.provider.use_gpsd", false); // HIDDEN
user_pref("geo.provider.use_geoclue", false); // true
user_pref("geo.provider.network.logging.enabled", true); // HIDDEN

user_pref("browser.region.update.enabled", false); // true
user_pref("browser.region.network.url", ""); // https://location.services.mozilla.com/v1/country?key=%MOZILLA_API_KEY%

user_pref("app.update.auto", false); // true

user_pref("browser.search.update", false); // true

user_pref("permissions.manager.defaultsUrl", ""); // resource://app/defaults/permissions

user_pref("webchannel.allowObject.urlWhitelist", ""); // https://content.cdn.mozilla.net https://install.mozilla.org

user_pref("privacy.resistFingerprinting.block_mozAddonManager", true); // false

user_pref("extensions.webextensions.restrictedDomains", ""); // accounts-static.cdn.mozilla.net,accounts.firefox.com,addons.cdn.mozilla.net,addons.mozilla.org,api.accounts.firefox.com,content.cdn.mozilla.net,discovery.addons.mozilla.org,install.mozilla.org,oauth.accounts.firefox.com,profile.accounts.firefox.com,support.mozilla.org,sync.services.mozilla.com

user_pref("extensions.quarantinedDomains.enabled", false); // true

user_pref("datareporting.policy.dataSubmissionEnabled", false); // true
user_pref("datareporting.healthreport.uploadEnabled", false); // true

user_pref("toolkit.telemetry.enabled", false); // true
user_pref("toolkit.telemetry.unified", false); // true
user_pref("toolkit.telemetry.server", "data:,"); // https://incoming.telemetry.mozilla.org
user_pref("toolkit.telemetry.archive.enabled", false); // true
user_pref("toolkit.telemetry.newProfilePing.enabled", false); // true
user_pref("toolkit.telemetry.shutdownPingSender.enabled", false); // true
user_pref("toolkit.telemetry.updatePing.enabled", false); // true
user_pref("toolkit.telemetry.bhrPing.enabled", false); // true
user_pref("toolkit.telemetry.firstShutdownPing.enabled", false); // true

user_pref("toolkit.coverage.enabled", false); // true
user_pref("toolkit.coverage.opt-out", true); // HIDDEN
user_pref("toolkit.coverage.endpoint.base", ""); // https://coverage.mozilla.org
user_pref("toolkit.telemetry.coverage.opt-out", true); // HIDDEN

user_pref("browser.newtabpage.activity-stream.telemetry", false); // true
user_pref("browser.newtabpage.activity-stream.feeds.telemetry", false); // true
user_pref("browser.newtabpage.activity-stream.telemetry.structuredIngestion.endpoint", ""); // https://incoming.telemetry.mozilla.org/submit

user_pref("app.shield.optoutstudies.enabled", false); // true

user_pref("app.normandy.enabled", false); // true
user_pref("app.normandy.api_url", ""); // https://normandy.cdn.mozilla.net/api/v1

user_pref("breakpad.reportURL", ""); // https://crash-stats.mozilla.org/report/index/
user_pref("browser.tabs.crashReporting.sendReport", false); // true

// user_pref("browser.crashReports.unsubmittedCheck.autoSubmit2", true); // false

user_pref("network.captive-portal-service.enabled", false); // true
user_pref("captivedetect.canonicalURL", ""); // http://detectportal.firefox.com/canonical.html

user_pref("network.connectivity-service.enabled", false); // true

user_pref("dom.private-attribution.submission.enabled", false); // true
user_pref("toolkit.telemetry.dap_helper", ""); // https://dap.services.mozilla.com
user_pref("toolkit.telemetry.dap_leader", ""); // https://dap-09-3.api.divviup.org/

// user_pref("browser.search.serpEventTelemetryCategorization.enabled", true); // false

// user_pref("memory.phc.enabled", false); // true

user_pref("doh-rollout.disable-heuristics", true); // HIDDEN
user_pref("dom.security.unexpected_system_load_telemetry_enabled", false); // true
user_pref("messaging-system.rsexperimentloader.enabled", false); // true
user_pref("network.trr.confirmation_telemetry_enabled", false); // true
user_pref("security.app_menu.recordEventTelemetry", false); // true
user_pref("security.certerrors.mitm.priming.enabled", false); // true
user_pref("security.certerrors.recordEventTelemetry", false); // true
user_pref("security.protectionspopup.recordEventTelemetry", false); // true
user_pref("signon.recipes.remoteRecipes.enabled", false); // true
user_pref("privacy.trackingprotection.emailtracking.data_collection.enabled", false); // true
user_pref("messaging-system.askForFeedback", false); // true


/******************************************************************************\
|*                                  PESKYFOX                                  *|
\******************************************************************************/


user_pref("browser.vpn_promo.enabled", false); // true
user_pref("browser.privatebrowsing.vpnpromourl", ""); // https://vpn.mozilla.org/?utm_source=firefox-browser&utm_medium=firefox-%CHANNEL%-browser&utm_campaign=private-browsing-vpn-link

user_pref("extensions.getAddons.showPane", false); // HIDDEN

user_pref("extensions.htmlaboutaddons.recommendations.enabled", false); // true

user_pref("browser.discovery.enabled", false); // true

// user_pref("browser.shell.checkDefaultBrowser", false); // true

user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons", false); // true
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features", false); // true

user_pref("browser.preferences.moreFromMozilla", false); // true

user_pref("browser.preferences.experimental", false); // true
user_pref("browser.preferences.experimental.hidden", true); // false

user_pref("browser.aboutConfig.showWarning", false); // true

user_pref("browser.aboutwelcome.enabled", false); // true
user_pref("startup.homepage_welcome_url", ""); // about:welcome
user_pref("startup.homepage_welcome_url.additional", ""); // HIDDEN
user_pref("startup.homepage_override_url", ""); // HIDDEN

user_pref("browser.messaging-system.whatsNewPanel.enabled", false); // HIDDEN

user_pref("browser.tabs.tabmanager.enabled", false); // true

user_pref("screenshots.browser.component.enabled", false); // true

// user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true); // false

// user_pref("browser.compactmode.show", true); // false

user_pref("browser.display.focus_ring_on_anything", true); // HIDDEN
user_pref("browser.display.focus_ring_style", 0); // HIDDEN
user_pref("browser.display.focus_ring_width", 0); // HIDDEN

// user_pref("layout.css.prefers-color-scheme.content-override", 0); // 2
// user_pref("browser.theme.dark-private-windows", false); // true

user_pref("cookiebanners.service.mode", 1); // 0
// user_pref("cookiebanners.service.mode.privateBrowsing", 1); // 0

// user_pref("browser.translations.enable", false); // true
// user_pref("browser.translations.autoTranslate", false); // HIDDEN

// user_pref("full-screen-api.transition-duration.enter", "0 0"); // 0 0
// user_pref("full-screen-api.transition-duration.leave", "0 0"); // 0 0

user_pref("full-screen-api.warning.delay", -1); // 500
user_pref("full-screen-api.warning.timeout", 0); // 3000

user_pref("gfx.webrender.quality.force-subpixel-aa-where-possible", true); // false

user_pref("browser.urlbar.suggest.addons", false); // true
user_pref("browser.urlbar.suggest.bookmark", false); // true
user_pref("browser.urlbar.suggest.calculator", false); // true
user_pref("browser.urlbar.suggest.clipboard", false); // true
user_pref("browser.urlbar.suggest.engines", false); // true
// user_pref("browser.urlbar.suggest.history", false); // true
user_pref("browser.urlbar.suggest.mdn", false); // true
// user_pref("browser.urlbar.suggest.openpage", false); // true
user_pref("browser.urlbar.suggest.pocket", false); // true
user_pref("browser.urlbar.suggest.recentsearches", false); // true
user_pref("browser.urlbar.suggest.remotetab", false); // true
user_pref("browser.urlbar.suggest.topsites", false); // true
user_pref("browser.urlbar.suggest.trending", false); // true
user_pref("browser.urlbar.suggest.weather", false); // true
user_pref("browser.urlbar.suggest.yelp", false); // true

user_pref("browser.urlbar.quickactions.enabled", false); // HIDDEN
user_pref("browser.urlbar.shortcuts.quickactions", false); // HIDDEN
// user_pref("browser.urlbar.unitConversion.enabled", true); // false
user_pref("browser.urlbar.trending.featureGate", false); // true
user_pref("browser.urlbar.addons.featureGate", false); // true
user_pref("browser.urlbar.mdn.featureGate", false); // HIDDEN
user_pref("browser.urlbar.yelp.featureGate", false); // true
// user_pref("browser.urlbar.clipboard.featureGate", true); // false
user_pref("browser.urlbar.recentsearches.featureGate", false); // true

user_pref("browser.urlbar.autoFill", false); // true
// user_pref("browser.urlbar.autoFill.adaptiveHistory.enabled", true); // false

user_pref("browser.urlbar.maxRichResults", 5); // 10

user_pref("dom.text_fragments.enabled", true); // false

user_pref("media.autoplay.default", 5); // 1
user_pref("media.autoplay.blocking_policy", 2); // 0

// user_pref("browser.startup.page", 3); // 1
user_pref("browser.startup.homepage", "https://start.duckduckgo.com/?k21=151515&k7=151515&k8=d0d0d0&k9=f4bf75&kaa=f4bf75&kj=151515&kx=6a9fb5&k18=1&k1=-1&k5=1&ka=n&kae=t&kaj=m&kak=-1&kao=-1&kap=-1&kaq=-1&kau=-1&kav=1&kax=-1&kay=b&kbd=-1&kbe=-1&kbg=-1&kd=-1&kf=-1&kg=p&kk=1&kl=wt-wt&kn=1&ko=1&kp=-2&kpsb=-1&ks=s&kt=n&kv=-1&kw=n"); // about:home

user_pref("browser.newtabpage.enabled", false); // true
user_pref("browser.newtabpage.activity-stream.discoverystream.enabled", false); // true
user_pref("browser.newtabpage.activity-stream.showSearch", false); // true
user_pref("browser.newtabpage.activity-stream.showWeather", false); // true
// user_pref("browser.newtabpage.activity-stream.system.showWeather", true); // false
user_pref("browser.newtabpage.activity-stream.showSponsored", false); // true
user_pref("browser.newtabpage.activity-stream.newtabWallpapers.enabled", false); // true
user_pref("browser.newtabpage.activity-stream.default.sites", "");
user_pref("browser.newtabpage.activity-stream.improvesearch.handoffToAwesomebar", false); // true
user_pref("browser.newtabpage.activity-stream.feeds.topsites", false); // true
user_pref("browser.newtabpage.activity-stream.feeds.section.topstories", false); // true
user_pref("browser.newtabpage.activity-stream.section.highlights.includeBookmarks", false); // true
user_pref("browser.newtabpage.activity-stream.section.highlights.includeDownloads", false); // true
user_pref("browser.newtabpage.activity-stream.section.highlights.includePocket", false); // true
user_pref("browser.newtabpage.activity-stream.section.highlights.includeVisited", false); // true

user_pref("browser.toolbars.bookmarks.visibility", "never"); // newtab

user_pref("extensions.pocket.enabled", false); // true
user_pref("extensions.pocket.api"," "); // api.getpocket.com
user_pref("extensions.pocket.oAuthConsumerKey", " ");
user_pref("extensions.pocket.site", " "); // getpocket.com
user_pref("extensions.pocket.showHome", false); // true

// user_pref("browser.download.always_ask_before_handling_new_types", true); // false

user_pref("browser.download.alwaysOpenPanel", false); // true
user_pref("browser.download.manager.addToRecentDocs", false); // true
user_pref("browser.download.open_pdf_attachments_inline", true); // false

user_pref("pdfjs.sidebarViewOnLoad", 2); // -1

// user_pref("browser.search.openintab", true); // false
// user_pref("browser.urlbar.openintab", true); // false

// user_pref("browser.link.open_newwindow.restriction", 0); // 2
// user_pref("browser.link.open_newwindow.override.external", 3); // -1

// user_pref("browser.tabs.loadBookmarksInTabs", true); // false
// user_pref("browser.tabs.loadBookmarksInBackground", true); // false

// user_pref("browser.bookmarks.openInTabClosesMenu", false); // true

user_pref("browser.menu.showViewImageInfo", true); // false

user_pref("findbar.highlightAll", true); // false

// user_pref("accessibility.typeaheadfind", true); // false

// user_pref("middlemouse.contentLoadURL", true); // false

user_pref("dom.disable_window_move_resize", true); // false

user_pref("browser.tabs.insertAfterCurrent", true); // false

// user_pref("browser.tabs.closeWindowWithLastTab", false); // true

user_pref("accessibility.blockautorefresh", true); // false
user_pref("browser.meta_refresh_when_inactive.disabled", true); // false

// user_pref("layout.word_select.eat_space_to_next_word", true); // false

user_pref("editor.word_select.delete_space_after_doubleclick_selection", true); // false

user_pref("dom.popup_allowed_events", "click dblclick"); // change click dblclick auxclick mousedown mouseup pointerdown pointerup notificationclick reset submit touchend contextmenu

user_pref("browser.tabs.hoverPreview.enabled", false); // true
user_pref("browser.tabs.hoverPreview.showThumbnails", false); // true

user_pref("reader.parse-on-load.enabled", false); // false

user_pref("browser.ctrlTab.sortByRecentlyUsed", true); // false

user_pref("ui.SpellCheckerUnderlineStyle", 1); // HIDDEN

user_pref("browser.bookmarks.max_backups", 1); // 15

user_pref("toolkit.zoomManager.zoomValues", ".3,.5,.67,.8,.9,.95,1,1.1,1.2,1.3,1.4,1.5,1.6,1.7,2,2.4,3"); // .3,.5,.67,.8,.9,1,1.1,1.2,1.33,1.5,1.7,2,2.4,3,4,5

user_pref("browser.display.show_image_placeholders", false); // true

user_pref("view_source.wrap_long_lines", true); // false
user_pref("devtools.debugger.ui.editor-wrapping", true); // false

user_pref("browser.tabs.tabMinWidth", 120); // 76

user_pref("ui.key.menuAccessKey", 0); // 18
user_pref("ui.key.menuAccessKeyFocuses", false); // false

user_pref("permissions.default.shortcuts", 2); // 0

user_pref("image.jxl.enabled", true); // false

user_pref("layout.css.moz-document.content.enabled", true); // HIDDEN
user_pref("layout.css.always_underline_links", true); // false


/******************************************************************************\
|*                                  SMOOTHFOX                                 *|
\******************************************************************************/


user_pref("apz.overscroll.enabled", true); // true

user_pref("general.smoothScroll", true); // false
user_pref("general.smoothScroll.currentVelocityWeighting", "1"); // 0.25
user_pref("general.smoothScroll.stopDecelerationWeighting", "1"); // 0.4

user_pref("general.smoothScroll.msdPhysics.enabled", true); // false
user_pref("general.smoothScroll.msdPhysics.continuousMotionMaxDeltaMS", 12); // 120
user_pref("general.smoothScroll.msdPhysics.motionBeginSpringConstant", 600); // 1250
user_pref("general.smoothScroll.msdPhysics.regularSpringConstant", 650); // 1000
user_pref("general.smoothScroll.msdPhysics.slowdownMinDeltaMS", 25); // 12
user_pref("general.smoothScroll.msdPhysics.slowdownMinDeltaRatio", "2"); // 1.3
user_pref("general.smoothScroll.msdPhysics.slowdownSpringConstant", 250); // 2000

user_pref("mousewheel.default.delta_multiplier_y", 300); // 100


/******************************************************************************\
|*                                END OF FILE                                 *|
\******************************************************************************/
