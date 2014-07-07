<nav class="navbar navbar-inverse navbar-global" role="navigation">
    <div class="container">
        <h1 class="visible-xs">$Title</h1>

        <%-- Brand and toggle get grouped for better mobile display --%>
        <div class="navbar-header">
            <div class="navbar-brand">
                <a class="logo" href="$BaseHref">
                    <% include BrandSvg %>
                    <span>SilverStripe</span>
                </a>
            </div>

            <a class="navbar-toggle collapsed visible-xs" href="javascript:void(0);" title="Close" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="ion-navicon"></span>
            </a>
        </div>

        <%-- Profile menu --%>
        <ul class="nav navbar-nav global-right hidden-xs">
            <li class="nav-search">
                <a class="ion-search" href="#NavbarSecondary" title="Search"></a>
            </li>
            <!-- <li class="hidden-xs">
                <a class="ion-ios7-bell" href="javascript:void(0);" title="Notifications"></a>
            </li> -->
            <li class="hidden-xs">                
                <iframe id="toolbar-iframe" src="{$ToolbarHostname}/toolbar/profile" width="40" height="40" frameborder="0" border="0"></iframe>
            </li>
        </ul>

        <%-- Navigation top level --%>
        <ul class="nav navbar-nav global-nav hidden-xs" role="navigation">
            <% loop $Pages %>    
                <li data-id="$ID">
                    <a href="$GlobalNavLink" data-link="$Link" title="Go to the $Title.XML page">$MenuTitle.XML</a>
                </li>
            <% end_loop %>
        </ul>

        <% include Header_MobileNavigation ToolbarHostname=$ToolbarHostname, Pages=$Pages %>
    </div>
</nav>

<% loop $Pages %>
<% if $ShouldShowChildren %>
<nav style="display:none;" class="navbar navbar-inverse navbar-secondary navbar-fixed-top" role="navigation" data-parent-id="$ID">
    <div class="container">
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav" role="navigation">
                <% loop $GlobalNavChildren %>
                    <li class="">
                        <a data-parent-id="$ParentID" href="$GlobalNavLink" title="Go to the $Title.XML page" class="<% if $HighlightMenu %>btn btn-default <% end_if %>">$MenuTitle.XML</a>
                    </li>
                <% end_loop %>
            </ul>
        </div><!--/.navbar-collapse -->
    </div>
</nav>
<% end_if %>
<% end_loop %>

<script type="text/javascript">
(function() {
var parentid, parent;
a = document.querySelector('.nav a[data-link="'+window.location.pathname+'"]');
if(!a) return;

a.parentNode.classList.add('current');
if(parentid = a.getAttribute('data-parent-id')) {        
    if(parent = document.querySelector('[data-id="'+parentid+'"]')) {            
        parent.classList.add('current');
        var childNav = document.querySelector('nav[data-parent-id="'+parentid+'"]');            
        document.querySelector('nav[data-parent-id="'+parentid+'"]').style.display='block';
    }
}

})();
</script>