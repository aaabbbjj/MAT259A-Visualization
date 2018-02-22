// keyboard function
//code reference: Sara Lafia
void keyPressed()
{ 
  if (key == 'n' || key == 'N')
  {
    if (normalization == true) normalization = false;
    else if (normalization == false) normalization = true;
  }
  if (key == 'c' || key == 'C')
  {
    if (colorApply == true) colorApply = false;
    else if (colorApply == false) colorApply = true;
  }
}