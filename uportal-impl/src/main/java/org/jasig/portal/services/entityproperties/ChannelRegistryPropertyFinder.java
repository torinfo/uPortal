/**
 * Copyright (c) 2000-2009, Jasig, Inc.
 * See license distributed with this file and available online at
 * https://www.ja-sig.org/svn/jasig-parent/tags/rel-10/license-header.txt
 */
package  org.jasig.portal.services.entityproperties;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.jasig.portal.ChannelRegistryStoreFactory;
import org.jasig.portal.EntityIdentifier;
import org.jasig.portal.channel.IChannelDefinition;


/**
 * A finder implementation to provide channel properties derived from the
 * ChannelRegistryManager
 *
 * @author Alex Vigdor av317@columbia.edu
 * @version $Revision$
 */
public class ChannelRegistryPropertyFinder
        implements IEntityPropertyFinder {
    
    private static final Log log = LogFactory.getLog(ChannelRegistryPropertyFinder.class);
    
   protected static String[] names;
   protected static final Class chan = IChannelDefinition.class;
   protected static boolean INITIALIZED = false;

 /**
    * Lazily initialize the static variables.
    */
   public static void init (){
      if (INITIALIZED){
         return;
      }
      /* this array should hold the desired attributes of a channel element
      as defined in channelRegistry.dtd
      */
      names = new String[5];
      names[0] = "Name";
      names[1] = "Title";
      names[2] = "Description";
      names[3] = "Functional Name";
      names[4] = "Timeout";
      INITIALIZED = true;
   }

    public ChannelRegistryPropertyFinder() {
       init();
    }

    public String[] getPropertyNames(EntityIdentifier entityID) {
        return  names;
    }

    public String getProperty(EntityIdentifier entityID, String name) {
        String r = null;
        if (entityID.getType().equals(chan)) {
            try {
                //Element c = ChannelRegistryManager.getChannel("chan"+entityID.getKey());
                //r = c.getAttribute(name);
                IChannelDefinition cd = ChannelRegistryStoreFactory.getChannelRegistryStoreImpl().getChannelDefinition(Integer.parseInt(entityID.getKey()));
                if (name.equals("Name")){
                  r = cd.getName(); 
                }
                if (name.equals("Title")){
                  r = cd.getTitle(); 
                }
                if (name.equals("Description")){
                  r = cd.getDescription();
                }
                if (name.equals("Functional Name")){
                  r = cd.getFName(); 
                }
                if (name.equals("Timeout")){
                  r = String.valueOf(cd.getTimeout()); 
                }
                if (name.equals("Secure")){
                  r = String.valueOf(cd.isSecure());
                }                
            } catch (Exception e) {
                log.error( "ChannelRegistryPropertyFinder.getProperty("+entityID.getKey()+"-"+entityID.getType().getName()+","+name+") :", e);
            }
        }
        return  r;
    }
}


