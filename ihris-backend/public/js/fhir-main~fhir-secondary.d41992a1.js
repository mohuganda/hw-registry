(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["fhir-main~fhir-secondary"],{"2bfd":function(t,e,i){},5311:function(t,e,i){"use strict";var s=i("5607"),n=i("a026");e["a"]=n["default"].extend({name:"rippleable",directives:{ripple:s["a"]},props:{ripple:{type:[Boolean,Object],default:!0}},methods:{genRipple:function(){var t=arguments.length>0&&void 0!==arguments[0]?arguments[0]:{};return this.ripple?(t.staticClass="v-input--selection-controls__ripple",t.directives=t.directives||[],t.directives.push({name:"ripple",value:{center:!0}}),t.on=Object.assign({click:this.onChange},this.$listeners),this.$createElement("div",t)):null},onChange:function(){}}})},"91dd":function(t,e,i){"use strict";function s(t,e){return Object.prototype.hasOwnProperty.call(t,e)}t.exports=function(t,e,i,a){e=e||"&",i=i||"=";var r={};if("string"!==typeof t||0===t.length)return r;var o=/\+/g;t=t.split(e);var l=1e3;a&&"number"===typeof a.maxKeys&&(l=a.maxKeys);var u=t.length;l>0&&u>l&&(u=l);for(var c=0;c<u;++c){var h,d,p,f,m=t[c].replace(o,"%20"),v=m.indexOf(i);v>=0?(h=m.substr(0,v),d=m.substr(v+1)):(h=m,d=""),p=decodeURIComponent(h),f=decodeURIComponent(d),s(r,p)?n(r[p])?r[p].push(f):r[p]=[r[p],f]:r[p]=f}return r};var n=Array.isArray||function(t){return"[object Array]"===Object.prototype.toString.call(t)}},"99fa":function(t,e,i){"use strict";i.r(e);var s=function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("ihris-element",{attrs:{edit:t.edit,loading:t.loading},scopedSlots:t._u([{key:"form",fn:function(){return[i("v-autocomplete",{attrs:{loading:t.loading,items:t.items,"search-input":t.search,"cache-items":"",flat:"","hide-no-data":"","hide-details":"",label:t.display,outlined:"",dense:"",placeholder:"Start typing for selection",rules:t.rules,disabled:t.disabled||t.preset&&"resource_add"===t.$route.name},on:{"update:searchInput":function(e){t.search=e},"update:search-input":function(e){t.search=e}},scopedSlots:t._u([{key:"label",fn:function(){return[t._v(t._s(t.display)+" "),t.required?i("span",{staticClass:"red--text font-weight-bold"},[t._v("*")]):t._e()]},proxy:!0}]),model:{value:t.select,callback:function(e){t.select=e},expression:"select"}})]},proxy:!0},{key:"header",fn:function(){return[t._v(" "+t._s(t.display)+" ")]},proxy:!0},{key:"value",fn:function(){return[t._v(" "+t._s(t.displayValue)+" ")]},proxy:!0}])})},n=[],a=(i("baa5"),i("d3b7"),i("ac1f"),i("841c"),i("b85c")),r=(i("96cf"),i("1da1")),o=i("b287"),l=i("b383"),u={name:"fhir-reference",props:["field","label","sliceName","targetProfile","min","max","base-min","base-max","slotProps","path","sub-fields","edit","readOnlyIfSet"],components:{IhrisElement:o["a"]},data:function(){return{source:{path:"",data:{}},value:{reference:""},qField:"valueReference",loading:!1,search:"",items:[],select:"",resource:"",awaitingSearch:!1,displayValue:"",preset:!1,disabled:!1}},created:function(){this.setupData()},watch:{slotProps:{handler:function(){this.setupData()},deep:!0},search:function(t){var e=this;this.awaitingSearch||setTimeout((function(){t&&t.length>1&&e.querySelections(e.search),e.awaitingSearch=!1}),500),this.awaitingSearch=!0},select:function(t){this.value.reference=t,this.getDisplay()}},methods:{setupData:function(){if(this.targetProfile&&(this.resource=this.targetProfile.substring(this.targetProfile.lastIndexOf("/")+1)),this.slotProps&&this.slotProps.source){if(this.source={path:this.slotProps.source.path+"."+this.field,data:{}},this.slotProps.source.fromArray)this.source.data=this.slotProps.source.data;else{var t=this.$fhirutils.pathFieldExpression(this.field),e=this.$fhirpath.evaluate(this.slotProps.source.data,t);this.source.data=e[0]}this.source.data&&(this.preset=!0,this.select=this.source.data.reference)}this.disabled=this.readOnlyIfSet&&this.preset},querySelections:function(t){var e=this;this.loading=!0;var i="/fhir/"+this.resource+"?"+l.stringify({"name:contains":t,_elements:"id"});fetch(i).then((function(t){t.ok?t.json().then(function(){var t=Object(r["a"])(regeneratorRuntime.mark((function t(i){var s,n,r,o,l;return regeneratorRuntime.wrap((function(t){while(1)switch(t.prev=t.next){case 0:e.items=[],s=Object(a["a"])(i.entry),t.prev=2,s.s();case 4:if((n=s.n()).done){t.next=14;break}return r=n.value,o=r.resource.resourceType+"/"+r.resource.id,l={value:o},t.next=10,e.$fhirutils.resourceLookup(o);case 10:l.text=t.sent,e.items.push(l);case 12:t.next=4;break;case 14:t.next=19;break;case 16:t.prev=16,t.t0=t["catch"](2),s.e(t.t0);case 19:return t.prev=19,s.f(),t.finish(19);case 22:e.loading=!1;case 23:case"end":return t.stop()}}),t,null,[[2,16,19,22]])})));return function(e){return t.apply(this,arguments)}}()):(console.log("Failed to retrieve",e.resource),e.loading=!1)}))},getDisplay:function(){var t=this;(!this.edit||this.preset)&&this.value&&this.value.reference&&(this.loading=!0,this.$fhirutils.resourceLookup(this.value.reference).then((function(e){t.displayValue=e,t.items.push({text:e,value:t.value.reference}),t.loading=!1})))}},computed:{index:function(){return this.slotProps?this.slotProps.input:void 0},display:function(){return this.slotProps&&this.slotProps.input?this.slotProps.input.label:this.label},required:function(){return(this.index||0)<this.min},rules:function(){var t=this;return this.required?[function(e){return!!e||t.display+" is required"}]:[]}}},c=u,h=i("2877"),d=i("6544"),p=i.n(d),f=i("c6a6"),m=Object(h["a"])(c,s,n,!1,null,null,null);e["default"]=m.exports;p()(m,{VAutocomplete:f["a"]})},"9d01":function(t,e,i){},b383:function(t,e,i){"use strict";e.decode=e.parse=i("91dd"),e.encode=e.stringify=i("e099")},c6a6:function(t,e,i){"use strict";i("4de4"),i("7db0"),i("c975"),i("d81d"),i("45fc"),i("498a");var s=i("5530"),n=(i("2bfd"),i("b974")),a=i("8654"),r=i("d9f7"),o=i("80d2"),l=Object(s["a"])(Object(s["a"])({},n["b"]),{},{offsetY:!0,offsetOverflow:!0,transition:!1});e["a"]=n["a"].extend({name:"v-autocomplete",props:{allowOverflow:{type:Boolean,default:!0},autoSelectFirst:{type:Boolean,default:!1},filter:{type:Function,default:function(t,e,i){return i.toLocaleLowerCase().indexOf(e.toLocaleLowerCase())>-1}},hideNoData:Boolean,menuProps:{type:n["a"].options.props.menuProps.type,default:function(){return l}},noFilter:Boolean,searchInput:{type:String,default:void 0}},data:function(){return{lazySearch:this.searchInput}},computed:{classes:function(){return Object(s["a"])(Object(s["a"])({},n["a"].options.computed.classes.call(this)),{},{"v-autocomplete":!0,"v-autocomplete--is-selecting-index":this.selectedIndex>-1})},computedItems:function(){return this.filteredItems},selectedValues:function(){var t=this;return this.selectedItems.map((function(e){return t.getValue(e)}))},hasDisplayedItems:function(){var t=this;return this.hideSelected?this.filteredItems.some((function(e){return!t.hasItem(e)})):this.filteredItems.length>0},currentRange:function(){return null==this.selectedItem?0:String(this.getText(this.selectedItem)).length},filteredItems:function(){var t=this;return!this.isSearching||this.noFilter||null==this.internalSearch?this.allItems:this.allItems.filter((function(e){var i=Object(o["q"])(e,t.itemText,void 0),s=null!=i?String(i):"";return t.filter(e,String(t.internalSearch),s)}))},internalSearch:{get:function(){return this.lazySearch},set:function(t){this.lazySearch=t,this.$emit("update:search-input",t)}},isAnyValueAllowed:function(){return!1},isDirty:function(){return this.searchIsDirty||this.selectedItems.length>0},isSearching:function(){return this.multiple&&this.searchIsDirty||this.searchIsDirty&&this.internalSearch!==this.getText(this.selectedItem)},menuCanShow:function(){return!!this.isFocused&&(this.hasDisplayedItems||!this.hideNoData)},$_menuProps:function(){var t=n["a"].options.computed.$_menuProps.call(this);return t.contentClass="v-autocomplete__content ".concat(t.contentClass||"").trim(),Object(s["a"])(Object(s["a"])({},l),t)},searchIsDirty:function(){return null!=this.internalSearch&&""!==this.internalSearch},selectedItem:function(){var t=this;return this.multiple?null:this.selectedItems.find((function(e){return t.valueComparator(t.getValue(e),t.getValue(t.internalValue))}))},listData:function(){var t=n["a"].options.computed.listData.call(this);return t.props=Object(s["a"])(Object(s["a"])({},t.props),{},{items:this.virtualizedItems,noFilter:this.noFilter||!this.isSearching||!this.filteredItems.length,searchInput:this.internalSearch}),t}},watch:{filteredItems:"onFilteredItemsChanged",internalValue:"setSearch",isFocused:function(t){t?(document.addEventListener("copy",this.onCopy),this.$refs.input&&this.$refs.input.select()):(document.removeEventListener("copy",this.onCopy),this.updateSelf())},isMenuActive:function(t){!t&&this.hasSlot&&(this.lazySearch=void 0)},items:function(t,e){e&&e.length||!this.hideNoData||!this.isFocused||this.isMenuActive||!t.length||this.activateMenu()},searchInput:function(t){this.lazySearch=t},internalSearch:"onInternalSearchChanged",itemText:"updateSelf"},created:function(){this.setSearch()},methods:{onFilteredItemsChanged:function(t,e){var i=this;t!==e&&(this.setMenuIndex(-1),this.$nextTick((function(){i.internalSearch&&(1===t.length||i.autoSelectFirst)&&(i.$refs.menu.getTiles(),i.setMenuIndex(0))})))},onInternalSearchChanged:function(){this.updateMenuDimensions()},updateMenuDimensions:function(){this.isMenuActive&&this.$refs.menu&&this.$refs.menu.updateDimensions()},changeSelectedIndex:function(t){this.searchIsDirty||(this.multiple&&t===o["w"].left?-1===this.selectedIndex?this.selectedIndex=this.selectedItems.length-1:this.selectedIndex--:this.multiple&&t===o["w"].right?this.selectedIndex>=this.selectedItems.length-1?this.selectedIndex=-1:this.selectedIndex++:t!==o["w"].backspace&&t!==o["w"].delete||this.deleteCurrentItem())},deleteCurrentItem:function(){if(!this.readonly){var t=this.selectedItems.length-1;if(-1!==this.selectedIndex||0===t){var e=this.selectedItems[this.selectedIndex];if(!this.getDisabled(e)){var i=this.selectedIndex===t?this.selectedIndex-1:this.selectedItems[this.selectedIndex+1]?this.selectedIndex:-1;-1===i?this.setValue(this.multiple?[]:void 0):this.selectItem(e),this.selectedIndex=i}}else this.selectedIndex=t}},clearableCallback:function(){this.internalSearch=void 0,n["a"].options.methods.clearableCallback.call(this)},genInput:function(){var t=a["a"].options.methods.genInput.call(this);return t.data=Object(r["a"])(t.data,{attrs:{"aria-activedescendant":Object(o["o"])(this.$refs.menu,"activeTile.id"),autocomplete:Object(o["o"])(t.data,"attrs.autocomplete","off")},domProps:{value:this.internalSearch}}),t},genInputSlot:function(){var t=n["a"].options.methods.genInputSlot.call(this);return t.data.attrs.role="combobox",t},genSelections:function(){return this.hasSlot||this.multiple?n["a"].options.methods.genSelections.call(this):[]},onClick:function(t){this.isDisabled||(this.selectedIndex>-1?this.selectedIndex=-1:this.onFocus(),this.isAppendInner(t.target)||this.activateMenu())},onInput:function(t){if(!(this.selectedIndex>-1)&&t.target){var e=t.target,i=e.value;e.value&&this.activateMenu(),this.internalSearch=i,this.badInput=e.validity&&e.validity.badInput}},onKeyDown:function(t){var e=t.keyCode;n["a"].options.methods.onKeyDown.call(this,t),this.changeSelectedIndex(e)},onSpaceDown:function(t){},onTabDown:function(t){n["a"].options.methods.onTabDown.call(this,t),this.updateSelf()},onUpDown:function(t){t.preventDefault(),this.activateMenu()},selectItem:function(t){n["a"].options.methods.selectItem.call(this,t),this.setSearch()},setSelectedItems:function(){n["a"].options.methods.setSelectedItems.call(this),this.isFocused||this.setSearch()},setSearch:function(){var t=this;this.$nextTick((function(){t.multiple&&t.internalSearch&&t.isMenuActive||(t.internalSearch=!t.selectedItems.length||t.multiple||t.hasSlot?null:t.getText(t.selectedItem))}))},updateSelf:function(){(this.searchIsDirty||this.internalValue)&&(this.valueComparator(this.internalSearch,this.getValue(this.internalValue))||this.setSearch())},hasItem:function(t){return this.selectedValues.indexOf(this.getValue(t))>-1},onCopy:function(t){if(-1!==this.selectedIndex){var e=this.selectedItems[this.selectedIndex],i=this.getText(e);t.clipboardData.setData("text/plain",i),t.clipboardData.setData("text/vnd.vuetify.autocomplete.item+plain",i),t.preventDefault()}}}})},e099:function(t,e,i){"use strict";var s=function(t){switch(typeof t){case"string":return t;case"boolean":return t?"true":"false";case"number":return isFinite(t)?t:"";default:return""}};t.exports=function(t,e,i,o){return e=e||"&",i=i||"=",null===t&&(t=void 0),"object"===typeof t?a(r(t),(function(r){var o=encodeURIComponent(s(r))+i;return n(t[r])?a(t[r],(function(t){return o+encodeURIComponent(s(t))})).join(e):o+encodeURIComponent(s(t[r]))})).join(e):o?encodeURIComponent(s(o))+i+encodeURIComponent(s(t)):""};var n=Array.isArray||function(t){return"[object Array]"===Object.prototype.toString.call(t)};function a(t,e){if(t.map)return t.map(e);for(var i=[],s=0;s<t.length;s++)i.push(e(t[s],s));return i}var r=Object.keys||function(t){var e=[];for(var i in t)Object.prototype.hasOwnProperty.call(t,i)&&e.push(i);return e}},ec29:function(t,e,i){},fe09:function(t,e,i){"use strict";i("4de4"),i("45fc"),i("d3b7"),i("25f0");var s=i("c37a"),n=i("5311"),a=i("8547"),r=i("58df");e["a"]=Object(r["a"])(s["a"],n["a"],a["a"]).extend({name:"selectable",model:{prop:"inputValue",event:"change"},props:{id:String,inputValue:null,falseValue:null,trueValue:null,multiple:{type:Boolean,default:null},label:String},data:function(){return{hasColor:this.inputValue,lazyValue:this.inputValue}},computed:{computedColor:function(){if(this.isActive)return this.color?this.color:this.isDark&&!this.appIsDark?"white":"primary"},isMultiple:function(){return!0===this.multiple||null===this.multiple&&Array.isArray(this.internalValue)},isActive:function(){var t=this,e=this.value,i=this.internalValue;return this.isMultiple?!!Array.isArray(i)&&i.some((function(i){return t.valueComparator(i,e)})):void 0===this.trueValue||void 0===this.falseValue?e?this.valueComparator(e,i):Boolean(i):this.valueComparator(i,this.trueValue)},isDirty:function(){return this.isActive},rippleState:function(){return this.disabled||this.validationState?this.validationState:void 0}},watch:{inputValue:function(t){this.lazyValue=t,this.hasColor=t}},methods:{genLabel:function(){var t=this,e=s["a"].options.methods.genLabel.call(this);return e?(e.data.on={click:function(e){e.preventDefault(),t.onChange()}},e):e},genInput:function(t,e){return this.$createElement("input",{attrs:Object.assign({"aria-checked":this.isActive.toString(),disabled:this.isDisabled,id:this.computedId,role:t,type:t},e),domProps:{value:this.value,checked:this.isActive},on:{blur:this.onBlur,change:this.onChange,focus:this.onFocus,keydown:this.onKeydown},ref:"input"})},onBlur:function(){this.isFocused=!1},onChange:function(){var t=this;if(!this.isDisabled){var e=this.value,i=this.internalValue;if(this.isMultiple){Array.isArray(i)||(i=[]);var s=i.length;i=i.filter((function(i){return!t.valueComparator(i,e)})),i.length===s&&i.push(e)}else i=void 0!==this.trueValue&&void 0!==this.falseValue?this.valueComparator(i,this.trueValue)?this.falseValue:this.trueValue:e?this.valueComparator(i,e)?null:e:!i;this.validate(!0,i),this.internalValue=i,this.hasColor=i}},onFocus:function(){this.isFocused=!0},onKeydown:function(t){}}})},ff03:function(t,e,i){"use strict";i.r(e);var s=function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("ihris-element",{attrs:{edit:t.edit,loading:!1},scopedSlots:t._u([{key:"form",fn:function(){return[i("v-switch",{attrs:{label:t.display+": "+t.value.toString(),disabled:t.disabled,rules:t.rules,dense:""},scopedSlots:t._u([{key:"label",fn:function(){return[t._v(t._s(t.display)+": "+t._s(t.value.toString())+" "),t.required?i("span",{staticClass:"red--text font-weight-bold"},[t._v("*")]):t._e()]},proxy:!0}]),model:{value:t.value,callback:function(e){t.value=e},expression:"value"}})]},proxy:!0},{key:"header",fn:function(){return[t._v(" "+t._s(t.display)+" ")]},proxy:!0},{key:"value",fn:function(){return[t._v(" "+t._s(t.value)+" ")]},proxy:!0}])})},n=[],a=i("b287"),r={name:"fhir-boolean",props:["field","label","min","max","id","path","slotProps","sliceName","base-min","base-max","edit","readOnlyIfSet"],components:{IhrisElement:a["a"]},data:function(){return{source:{path:"",data:{}},value:!0,qField:"valueBoolean",disabled:!1}},created:function(){this.setupData()},watch:{slotProps:{handler:function(){this.setupData()},deep:!0}},methods:{setupData:function(){if(this.slotProps&&this.slotProps.source){if(this.source={path:this.slotProps.source.path+"."+this.field,data:{}},this.slotProps.source.fromArray)this.source.data=this.slotProps.source.data,this.value=this.source.data;else{var t=this.$fhirutils.pathFieldExpression(this.field);this.source.data=this.$fhirpath.evaluate(this.slotProps.source.data,t),1==this.source.data.length&&(this.value=this.source.data[0])}this.disabled=this.readOnlyIfSet&&!!this.value}}},computed:{index:function(){return this.slotProps&&this.slotProps.input?this.slotProps.input.index:void 0},display:function(){return this.slotProps&&this.slotProps.input?this.slotProps.input.label:this.label},required:function(){return(this.index||0)<this.min},rules:function(){var t=this;return this.required?[function(e){return!!e||t.display+" is required"}]:[]}}},o=r,l=i("2877"),u=i("6544"),c=i.n(u),h=(i("0481"),i("4069"),i("5530")),d=(i("ec29"),i("9d01"),i("fe09")),p=i("c37a"),f=i("c3f0"),m=i("0789"),v=i("490a"),g=i("80d2"),y=d["a"].extend({name:"v-switch",directives:{Touch:f["a"]},props:{inset:Boolean,loading:{type:[Boolean,String],default:!1},flat:{type:Boolean,default:!1}},computed:{classes:function(){return Object(h["a"])(Object(h["a"])({},p["a"].options.computed.classes.call(this)),{},{"v-input--selection-controls v-input--switch":!0,"v-input--switch--flat":this.flat,"v-input--switch--inset":this.inset})},attrs:function(){return{"aria-checked":String(this.isActive),"aria-disabled":String(this.disabled),role:"switch"}},validationState:function(){return this.hasError&&this.shouldValidate?"error":this.hasSuccess?"success":null!==this.hasColor?this.computedColor:void 0},switchData:function(){return this.setTextColor(this.loading?void 0:this.validationState,{class:this.themeClasses})}},methods:{genDefaultSlot:function(){return[this.genSwitch(),this.genLabel()]},genSwitch:function(){return this.$createElement("div",{staticClass:"v-input--selection-controls__input"},[this.genInput("checkbox",Object(h["a"])(Object(h["a"])({},this.attrs),this.attrs$)),this.genRipple(this.setTextColor(this.validationState,{directives:[{name:"touch",value:{left:this.onSwipeLeft,right:this.onSwipeRight}}]})),this.$createElement("div",Object(h["a"])({staticClass:"v-input--switch__track"},this.switchData)),this.$createElement("div",Object(h["a"])({staticClass:"v-input--switch__thumb"},this.switchData),[this.genProgress()])])},genProgress:function(){return this.$createElement(m["c"],{},[!1===this.loading?null:this.$slots.progress||this.$createElement(v["a"],{props:{color:!0===this.loading||""===this.loading?this.color||"primary":this.loading,size:16,width:2,indeterminate:!0}})])},onSwipeLeft:function(){this.isActive&&this.onChange()},onSwipeRight:function(){this.isActive||this.onChange()},onKeydown:function(t){(t.keyCode===g["w"].left&&this.isActive||t.keyCode===g["w"].right&&!this.isActive)&&this.onChange()}}}),b=Object(l["a"])(o,s,n,!1,null,null,null);e["default"]=b.exports;c()(b,{VSwitch:y})}}]);
//# sourceMappingURL=fhir-main~fhir-secondary.d41992a1.js.map