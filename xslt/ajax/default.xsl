<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="udata[@module='custom'][@method='getRecomendedActions' or @method='getTypeActions' or @method='getCalendarActions']">
        <xsl:apply-templates select="items/item" mode="action"/>
    </xsl:template>

    <xsl:template match="item" mode="action">
        <li>
            <xsl:if test="@et = 'true'">
                <span class="e-ticket-mark">e-ticket</span>
            </xsl:if>
            <a href="/events_page/?guid={@id}" class="img-h">
                <img src="{@img}" alt="image" width="275" height="210" />
            </a>
            <strong class="ttl">
                <a href="/events_page/?guid={@id}">
                    <xsl:value-of select="."/>
                </a>
                <span class="age-limits">
                    <xsl:value-of select="@rating"/>
                </span>
            </strong>
            <div class="event-info">
                <div class="event-h">
                    <strong class="place">
                        <a href="/venue/?guid={@vid}">
                            <xsl:value-of select="@owner"/>
                        </a>
                    </strong>
                    <em class="date">
                        <xsl:if test="@amount &gt; 1">C </xsl:if> <xsl:value-of select="@date"/>
                    </em>
                </div>
                <div class="btn-cart-h">
                    <a href="/events_page/?guid={@id}" class="btn-cart">корзина</a>
                </div>
            </div>
        </li>
    </xsl:template>

</xsl:stylesheet>