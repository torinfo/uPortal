<?xml version="1.0"?>
<!--

    Copyright (c) 2000-2009, Jasig, Inc.
    See license distributed with this file and available online at
    https://www.ja-sig.org/svn/jasig-parent/tags/rel-10/license-header.txt

-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:param name="baseActionURL">render.userLayoutRootNode.uP</xsl:param>
  <xsl:param name="skinsPath">media/org/jasig/portal/layout/tab-column/nested-tables</xsl:param>
  <xsl:param name="currentSkin">java</xsl:param>
  <xsl:param name="locale">en_US</xsl:param>
  <xsl:variable name="mediaPath">media/org/jasig/portal/layout/tab-column/nested-tables</xsl:variable>

  <xsl:template match="/">
    <xsl:apply-templates select="skins"/>
  </xsl:template>

  <xsl:template match="skins">
        <form name="form1" method="post" action="{$baseActionURL}">
        <table width="100%" border="0" cellspacing="0" cellpadding="10" class="uportal-background-light">
          <tr class="uportal-channel-text">
            <td><strong>Skin Selection:</strong> Select a portal skin below, then click [Apply].</td>
          </tr>
          <tr class="uportal-channel-text">
            <td>
              <table width="100%" border="0" cellspacing="0" cellpadding="2" class="uportal-background-content">
                <tr class="uportal-channel-table-header">
                  <td nowrap="nowrap">Option</td>
                  <td>
                    <img alt="" src="{$mediaPath}/{$currentSkin}/skin/transparent.gif" width="16" height="8"/>
                  </td>
                  <td nowrap="nowrap">Thumbnail</td>
                  <td>
                    <img alt="" src="{$mediaPath}/{$currentSkin}/skin/transparent.gif" width="16" height="8"/>
                  </td>
                  <td width="100%"><img alt="" src="{$mediaPath}/{$currentSkin}/skin/transparent.gif" width="1" height="1"/></td>
                </tr>
                <tr class="uportal-channel-table-header">
                  <td colspan="5">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="uportal-background-light">
                      <tr>
                        <td>
                          <img alt="" src="{$mediaPath}/{$currentSkin}/skin/transparent.gif" width="2" height="2"/>
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <xsl:apply-templates select="skin">
                  <xsl:sort select="skin-name"/>
                </xsl:apply-templates>                
              </table>
            </td>
          </tr>
          <tr>
            <td>
              <input type="hidden" name="action" value="completeEdit"/>
              <input type="submit" name="submitSave" value="Apply" class="uportal-button"/>
              <input type="submit" name="submitCancel" value="Cancel" class="uportal-button"/>              
            </td>
          </tr>
        </table>
        </form>
  </xsl:template>


  <xsl:template match="skin">
    <tr valign="top">
      <td align="center">
        <xsl:choose>
          <xsl:when test="$currentSkin=skin">
            <input type="radio" name="skinName" value="{skin}" checked="checked"/>
          </xsl:when>
          <xsl:otherwise>
            <input type="radio" name="skinName" value="{skin}"/>
          </xsl:otherwise>
        </xsl:choose>
      </td>
      <td><img alt="" src="{$mediaPath}/{$currentSkin}/skin/transparent.gif" width="1" height="1"/></td>
      <td>
        <img height="90" alt="{skin-name} thumbnail" src="{$skinsPath}/{skin}/skin/{skin}_thumb.gif" width="120" border="0"/>
      </td>
      <td><img alt="" src="{$mediaPath}/{$currentSkin}/skin/transparent.gif" width="1" height="1"/></td>
      <td class="uportal-channel-table-header">
        <table width="100%" border="0" cellspacing="0" cellpadding="2">
          <tr valign="top">
            <td class="uportal-channel-table-header">Name:</td>
            <td width="100%" class="uportal-channel-text">
              <strong>
                <xsl:value-of select="skin-name"/>
              </strong>
            </td>
          </tr>
          <tr valign="top">
            <td nowrap="nowrap" class="uportal-channel-table-header">Description:<img alt="" src="{$mediaPath}/{$currentSkin}/skin/transparent.gif" width="4" height="4"/></td>
            <td class="uportal-channel-text">
              <xsl:value-of select="skin-description"/>
            </td>
          </tr>
        </table>
      </td>
    </tr>
    <tr class="uportal-channel-table-header">
      <td colspan="5">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="uportal-background-light">
          <tr>
            <td>
              <img alt="" src="{$mediaPath}/{$currentSkin}/skin/transparent.gif" width="1" height="1"/>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </xsl:template>
</xsl:stylesheet>