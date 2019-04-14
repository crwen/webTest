
			window.onload = function() {
				/*
				 * 拖拽box1
				 * 	1.当鼠标在被拖拽元素上按下是，开始拖拽 onmousedown
				 * 	2.当鼠标移动是别拖拽元素跟随鼠标移动 onmousemove
				 * 	3.当鼠标松开是，别拖拽元素固定在当前位置 onmouseup
				 * 
				 */
				//获取box1
				var box1 = document.getElementById("box1");
				//为box1绑定一个按下事件
				box1.onmousedown = function() {
					//alert("鼠标按下，开始拖拽");
					
					/*
					 * setCapture()
					 * 	只有IE支持，但是在火狐中调用时不会报错
					 * 		而如果使用chrome调用，会报错
					 */
					if(box1.setCapture) {
						box1.setCapture();
					}
					
//					event = event || windwo.event;
					//div的偏移量 鼠标.clentX - 元素.offsetLeft
					//div的偏移量 鼠标.clentY - 元素.offsetTop
					var ol = event.clientX - box1.offsetLeft;
					var ot = event.clientY - box1.offsetTop;
					document.onmousemove = function(event) {
						event = event || windwo.event;
						//当鼠标移动时，被拖拽元素跟随鼠标移动onmousemove
						//获取鼠标的坐标
						var left = event.clientX - ol;
						var top = event.clientY - ot;
						
						//修改box1的位置
						box1.style.left = left + "px";
						box1.style.top  = top + "px";
					};
					
					
					//为document.onmouseup绑定一个鼠标松开事件
					document.onmouseup= function() {
					//当鼠标松开是，被拖拽元素固定在当前位置 onmouseup
					//取消document的onmousemove事件
					document.onmousemove = null;
					
					box1.releaseCapture && box1.releaseCapture();
					//取消document.onmouseup
					document.onmouseup = null;
					};
					
					/*
					 * 当我们拖拽一个网页中的内容时，浏览器会默认去搜索引擎中的搜索内容，
					 * 此时会导致拖拽功能的异常，这个是浏览器提供的默认行为
					 * 若果不希望发生这个行为，则可以通过return false来取消默认行为
					 * 
					 * 但是这招对IE8不起作用
					 */
					
					return false;
				};
				

				
				
				
				
			};
			